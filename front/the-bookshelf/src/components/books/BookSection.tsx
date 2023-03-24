import BookCard from "./BookCard";
import "./_books.scss"
import { uID } from "@/utils/UtilsFunctions";

interface BookSectionProps {
    title: string;
    books: Object[];
}

function BookSection({title, books}: BookSectionProps) {
    
    return (
        <div className="section__books">
            <h4>{title}</h4>
            <div className="books__row">
                {books.map((book, index) => {
                    return <BookCard book={book} key={index}/>
                })}
            </div>
        </div>
    )
}

export default BookSection;