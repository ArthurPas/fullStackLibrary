import { Book } from "@/utils/Types";
import BookCard from "./BookCard";
import "./_books.scss"

/**
 * @interface BookSectionProps - Defines the props of the BookSection component
 * 
 * @property {string} title - The title of the section
 * @property {Book[]} books - The books to display
 */
interface BookSectionProps {
    title: string;
    books: Book[];
}

/**
 * @component BookSection - Display a section with a title and a list of books
 * 
 * @param {BookSectionProps} props - The props of the component
 * 
 * @returns {JSX.Element} - The BookSection component
 * 
 * @example <BookSection title="Recently added books" books={newBooks}/>
 */
function BookSection({title, books}: BookSectionProps) {

    return (
        <div className="section__books">
            <h4>{title}</h4>
            <div className="books__row">

                {books && books.length > 0 ? books.map((book, index) => {
                    return <BookCard small={false} book={(book as Book)} key={index}/>
                }): <p>No books found</p>}
            </div>
        </div>
    )
}

export default BookSection;