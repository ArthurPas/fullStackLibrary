import BookSection from "@/components/books/BookSection";
import { useQuery } from "react-query";
import { SearchInput, HeroBanner, Nav } from "@/components";
import { BASE_API_URL } from "@/main";

export type Book = {
    title: string;
}

function Home() {

    const { data, status } = useQuery('books', () => fetchRecentsBooks(5));

    const fetchRecentsBooks = async (nbBooks: number) => {
        const response = await fetch(`${BASE_API_URL}/books?number=4&type=recent`);

        if (!response.ok) {
            throw new Error('Something went wrong');
        }

        return response.json();
    }

    
    return (
        <>
            <HeroBanner/>
            <SearchInput/>
            <div className="content__books">
                {status === 'loading' && (<p>Loading...</p>)}
                {status === 'error' && (<p>Error fetching data</p>)}
                {status === 'success' && (
                    <>
                        <BookSection title="Recently added books" books={data.slice(0, 5)}/>
                        <BookSection title="Most liked books" books={undefined}/>
                    </>
                )}
            </div>
        </>
    )
}

export default Home;