import { FaFeatherAlt, FaBook } from "react-icons/fa";
import { BsFillCalendarDateFill, BsBroadcastPin } from "react-icons/bs";
import { Link } from "react-router-dom";
import { Book } from "@/utils/Types";

/**
 * @interface BookCardProps - Defines the props for the BookCard component
 * 
 * @property {Book} book - The book to display
 * @property {boolean} small - If the card is small or not, if true, the card                         will be smaller and display less information
 */
interface BookCardProps {
    book: Book;
    small: boolean;
}

/**
 * @component BookCard - Display a book card with the book's information
 * 
 * @param {BookCardProps} props - The props of the component
 * 
 * @returns {JSX.Element} - The BookCard component
 * 
 * @example <BookCard book={book} small={false}/>
 * 
 */
function BookCard({book, small}: BookCardProps) {

    return (
        <Link to={`/book/${book.idBook}`} className={small ? "book__card small" : "book__card"}>
            <img src={book.image || "/src/assets/book-placeholder.png"} alt=""/>
            <div className="book__card__info">
                    {!small && (<p><FaFeatherAlt/> { book.authors || "No author" }</p>)}
                    <p><FaBook/> { book.title || "No Title" }</p>
                    {!small && (<p><BsFillCalendarDateFill/> { book.releaseDate || "-" }</p>)}
                    {!small && (<p><BsBroadcastPin/> { book.editor || "No editor"} </p>)}
            </div>
        </Link>
    )
}

export default BookCard;