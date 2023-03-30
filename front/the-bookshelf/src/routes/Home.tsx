import BookSection from "@/components/books/BookSection";
import { useQuery } from "react-query";
import { HeroBanner, SearchInput } from "@/components";
import { BASE_API_URL } from "@/utils/Constants";
import { User } from "@/utils/Types";
import { useState } from "react";
import { uID } from "@/utils/UtilsFunctions";
import StartSearching from "@/components/placeholders/StartSeaching";

function Home() {

    const { data: newBooks, status: statusNewBooks } = useQuery("newBooks", () => fetchRecentsBooks(4), {
        enabled: localStorage.getItem('accessToken') ? true : false
    });

    const { data: borrows, status: statusBorrows } = useQuery("borrows", () => fetchBorrows(), {
        enabled: localStorage.getItem('accessToken') ? true : false,
        refetchOnMount: false,
    });

    const fetchBorrows = async () => {
        let result: any = [];
        const user: User = JSON.parse(localStorage.getItem('user')!);
        const response = await fetch(`${BASE_API_URL}/borrow/user/${user.email}`);

        if (!response.ok) {
            throw new Error('Something went wrong');
        }

        return response.json();
    }

    const fetchRecentsBooks = async (nbBooks: number) => {
        const user: User = JSON.parse(localStorage.getItem('user')!);
        const response = await fetch(`${BASE_API_URL}/books?nbResults=${nbBooks}&type=DESC`);

        if (!response.ok) {
            throw new Error('Something went wrong');
        }

        return response.json();
    }
    
    return (
        <>
            <HeroBanner/>
            <SearchInput/>
            <div className="content__books">
                {statusNewBooks == "success" && newBooks && (
                    <BookSection title="Recently added books" books={newBooks} key={uID.next().value as number}/>
                )}
                {statusBorrows == "success" && borrows && (
                    <BookSection title="Last borrowed books" books={borrows} key={uID.next().value as number}/>
                )}
            </div>
            {(localStorage.getItem('accessToken') == null) && (<StartSearching/>)}
        </>
    )
}

export default Home;