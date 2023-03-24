interface BookCardProps {
    book: Object;
}

function BookCard({book}: BookCardProps) {

    return (
        <div className="book__card test">
            <img src={book ? "/src/assets/book-placeholder.svg" : ""} alt=""/>
        </div>
    )
}

export default BookCard;