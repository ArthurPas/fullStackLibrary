import { Book } from "@/utils/Types";
import BookCard from "./BookCard";
import Paginator from "../pagination/Paginator"
import "./_books.scss"

interface BookSectionProps {
    title: string;
    books: Object[];
}

function BookSection({ title, books }: BookSectionProps) {

    return (
        <div className="section__books">
            <h4>{title}</h4>
            <div className="books__row">

                {books ? books.map((book, index) => {
                    return <BookCard book={(book as Book)} key={index} />
                }) : <p>No books found</p>}
            </div>
            <div className="paginator__row">
                <Paginator
                    currentPage={1}
                    totalPages={1}
                    /*handlePrevPage={1}
                    handleNextPage={1}*/
                    booksPerPage={1}
                    totalItems={1}
                    currentBooks={1}
                />
            </div>
        </div>
    )
}

export default BookSection;