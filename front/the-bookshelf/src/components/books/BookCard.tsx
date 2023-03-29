import { useState } from "react";
import { FaFeatherAlt } from "react-icons/fa";
import { useQuery } from "react-query";
import { BASE_API_URL } from "@/utils/Constants";
import { FaBook } from "react-icons/fa";
import { BsFillCalendarDateFill } from "react-icons/bs";
import { Link } from "react-router-dom";

interface BookCardProps {
    book: any;
}

function BookCard({book}: BookCardProps) {

    const { data, status } = useQuery('author', () => fetchAuthor(book.idAuthor));

    const fetchAuthor = async (authorId: number) => {
        const response = await fetch(`${BASE_API_URL}/author/${authorId}`);
        if (!response.ok) {
            throw new Error('Something went wrong');
        }
        return response.json();
    }

    return (
        <Link to={`/book/${book.idBook}`} className="book__card">
            <img src={book.image || "/src/assets/book-placeholder.png"} alt=""/>
            {status === 'error' && (<p>Error fetching data</p>)}
            {status === 'loading' && (<p>Loading...</p>)}
            <div className="book__card__info">
                {status === 'success' && (
                    <>
                        <p><FaFeatherAlt/> { data[0].authorName || "No author" }</p>
                        <p><FaBook/> { book.title || "No Title" }</p>
                        <p><BsFillCalendarDateFill/> { book.releaseDate || "-" }</p>
                    </>
                )}
            </div>
        </Link>
    )
}

export default BookCard;