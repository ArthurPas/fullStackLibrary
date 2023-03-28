import BookCard from "./BookCard";
import "./_books.scss"
import { uID } from "@/utils/UtilsFunctions";

interface BookSectionProps {
    title: string;
    books: Object[] | undefined;
}

function BookSection({title, books}: BookSectionProps) {
    
    console.log(books);
    return (
        <div className="section__books">
            <h4>{title}</h4>
            <div className="books__row">

                {books ? books.map((book, index) => {
                    return <BookCard book={book} key={index}/>
                }): <p>No books found</p>}
            </div>
        </div>
    )
}

export default BookSection;