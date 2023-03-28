import { FaFeatherAlt } from "react-icons/fa";

interface BookCardProps {
    book: any;
}

function BookCard({book}: BookCardProps) {

    return (
        <div className="book__card">
            <img src={book.image || "/src/assets/book-placeholder.png"} alt=""/>
            <p><FaFeatherAlt/> {book.author || "No author"} </p>
        </div>
    )
}

export default BookCard;

/**
 * framework symfony :
 * 
 * gestion du token et de l'authentification automatique
 * 
 * 
 */