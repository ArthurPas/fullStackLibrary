import { Book } from "@/utils/Types";
import BookCard from "./BookCard";
import "./_books.scss"

interface BookSectionProps {
    title: string;
    books: Object[];
}

function BookSection({title, books}: BookSectionProps) {

    return (
        <div className="section__books">
            <h4>{title}</h4>
            <div className="books__row">

                {books ? books.map((book, index) => {
                    return <BookCard book={(book as Book)} key={index}/>
                }): <p>No books found</p>}
            </div>
        </div>
    )
}

export default BookSection;