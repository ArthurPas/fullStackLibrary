interface BookCardProps {
    book: any;
}

function BookCard({book}: BookCardProps) {

    return (
        <div className="book__card">
            <img src={book.image || "/src/assets/book-placeholder.png"} alt=""/>
        </div>
    )
}

export default BookCard;