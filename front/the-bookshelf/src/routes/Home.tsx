import BookSection from "@/components/books/BookSection";
import { SearchInput, HeroBanner, Nav } from "../components";

export type Book = {
    title: string;
}

function Home() {

    const bookList: Book[] = [
        {
            title: "Book 1"
        },
        {
            title: "Book 2"
        },
        {
            title: "Book 3"
        },
        {
            title: "Book 4"
        },
    ]
    
    return (
        <>
            <HeroBanner/>
            <SearchInput/>
            <div className="content__books">
                <BookSection title="Recently added books" books={bookList}/>
                <BookSection title="Most liked books" books={bookList}/>
            </div>
        </>
    )
}

export default Home;