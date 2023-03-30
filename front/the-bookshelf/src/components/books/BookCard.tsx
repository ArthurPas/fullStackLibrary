import { useState } from "react";
import { FaFeatherAlt } from "react-icons/fa";
import { useQuery } from "react-query";
import { BASE_API_URL } from "@/utils/Constants";
import { FaBook } from "react-icons/fa";
import { BsFillCalendarDateFill, BsBroadcastPin } from "react-icons/bs";
import { Link } from "react-router-dom";
import { Book } from "@/utils/Types";

interface BookCardProps {
    book: Book;
}

function BookCard({book}: BookCardProps) {

    return (
        <Link to={`/book/${book.idBook}`} className="book__card">
            <img src={book.image || "/src/assets/book-placeholder.png"} alt=""/>
            <div className="book__card__info">
                    <p><FaFeatherAlt/> { book.authors || "No author" }</p>
                    <p><FaBook/> { book.title || "No Title" }</p>
                    <p><BsFillCalendarDateFill/> { book.releaseDate || "-" }</p>
                    <p><BsBroadcastPin/> { book.editor || "No editor"} </p>
            </div>
        </Link>
    )
}

export default BookCard;