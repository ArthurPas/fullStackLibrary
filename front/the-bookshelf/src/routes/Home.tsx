import BookSection from "@/components/books/BookSection";
import { useQuery } from "react-query";
import { HeroBanner, SearchInput } from "@/components";
import { BASE_API_URL } from "@/utils/Constants";
import { User } from "@/utils/Types";
import { useState } from "react";

function Home() {

    const { data, status } = useQuery('books', () => fetchRecentsBooks(4));

    const fetchRecentsBooks = async (nbBooks: number) => {
        const response = await fetch(`${BASE_API_URL}/books?nbResults=${nbBooks}&type=DESC`);

        if (!response.ok) {
            throw new Error('Something went wrong');
        }

        const newBooks = await response.json();

        if (localStorage.getItem('accessToken')) {
            const user: User = JSON.parse(localStorage.getItem('user')!);
            const responseBorrowed = await fetch(`${BASE_API_URL}/borrow/user/${user.email}`);

            if (!responseBorrowed.ok) {
                throw new Error('Something went wrong');
            }

            const borrows = await responseBorrowed.json();

            let borrowedBooks = borrows.map((borrow: any) => {
                // Return new book object
                return {
                    idBook: borrow.idBook,
                    title: borrow.title,
                    image: borrow.image,
                }
            })

            borrowedBooks = borrowedBooks.slice(0, 4);

            return {
                newBooks: newBooks,
                borrowedBooks: borrowedBooks,
            }
        }

        return newBooks;
    }

    const statusHandler = (status: string) => {
        switch (status) {
            case 'loading':
                return <p>Loading...</p>;
            case 'error':
                return <p>Error fetching data</p>;
            case 'success':
                if (localStorage.getItem('accessToken')) {
                    console.log(data);
                    return (
                        <div className="content__books">
                            <BookSection title="Recently added books" books={data.newBooks}/>
                            <BookSection title="Your last borrowed books" books={data.borrowedBooks}/>
                        </div>
                    );
                }
                return (
                    <div className="content__books">
                        <BookSection title="Recently added books" books={data}/>
                    </div>
                );
        }
    }
    
    return (
        <>
            <HeroBanner/>
            <SearchInput/>
            {statusHandler(status)}
        </>
    )
}

export default Home;