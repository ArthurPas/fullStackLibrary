import { useState } from "react";
import { FaFeatherAlt } from "react-icons/fa";
import { useQuery } from "react-query";
import { BASE_API_URL } from "@/main";

interface BookCardProps {
    book: any;
}

function BookCard({book}: BookCardProps) {

    const [author, setAuthor] = useState<string>("");

    const {data, error} = useQuery("author", () => {
        return fetch(`${BASE_API_URL}/${book.idAuthor}`)
        .then(res => res.json())
    });

    return (
        <div className="book__card">
            <img src={book.image || "/src/assets/book-placeholder.png"} alt=""/>
            <p><FaFeatherAlt/> {author || "No author"} </p>
        </div>
    )
}

export default BookCard;