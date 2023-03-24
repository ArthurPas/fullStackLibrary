interface BookCardProps {
    book: Object;
}

function BookCard({book}: BookCardProps) {

    return (
        <div className="book__card">
            <img src={book ? "/src/assets/book-placeholder.svg" : ""} alt=""/>
        </div>
    )
}

export default BookCard;