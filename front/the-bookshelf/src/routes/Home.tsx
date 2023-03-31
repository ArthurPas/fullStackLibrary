import BookSection from "@/components/books/BookSection";
import { useQuery } from "react-query";
import { HeroBanner, SearchInput } from "@/components";
import { BASE_API_URL } from "@/utils/Constants";
import { User } from "@/utils/Types";
import { useState } from "react";
import { uID } from "@/utils/UtilsFunctions";
import StartSearching from "@/components/placeholders/StartSeaching";

/**
 * @component Home - A page to display the home page of the application
 * 
 * @returns {JSX.Element} - The Home component
 */
function Home() {

    // The useQuery hooks are enabled only if the user is logged in

    // Fetch the new books using react-query's useQuery hook
    const { data: newBooks, status: statusNewBooks } = useQuery("newBooks", () => fetchRecentsBooks(4), {
        enabled: localStorage.getItem('accessToken') ? true : false
    });

    // Fetch the last borrowed books of the user using react-query's useQuery hook
    const { data: borrows, status: statusBorrows } = useQuery("borrows", () => fetchBorrows(), {
        enabled: localStorage.getItem('accessToken') ? true : false,
        refetchOnMount: false,
    });

    /**
     * @function fetchBorrows - Fetch the last borrowed books of the user
     * 
     * @returns {Promise<Book[]>} - The last borrowed books of the user
     */
    const fetchBorrows = async () => {
        let result: any = [];
        const user: User = JSON.parse(localStorage.getItem('user')!);
        const response = await fetch(`${BASE_API_URL}/borrow/user/${user.email}`);

        if (!response.ok) {
            throw new Error('Something went wrong');
        }

        return response.json();
    }

    /**
     * @function fetchRecentsBooks - Fetch the last added books in the database
     * 
     * @param {number} nbBooks - The number of books to fetch
     * 
     * @returns {Promise<Book[]>} - The new books
     */
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