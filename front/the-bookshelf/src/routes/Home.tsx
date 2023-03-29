import BookSection from "@/components/books/BookSection";
import { useQuery } from "react-query";
import { HeroBanner, SearchInput } from "@/components";
import { BASE_API_URL } from "@/utils/Constants";

function Home() {

    const { data, status } = useQuery('books', () => fetchRecentsBooks(5));

    const fetchRecentsBooks = async (nbBooks: number) => {
        const response = await fetch(`${BASE_API_URL}/books?nbResults=${nbBooks}&type=DESC`);


        if (!response.ok) {
            throw new Error('Something went wrong');
        }

        return response.json();
    }

    const statusHandler = (status: string) => {
        switch (status) {
            case 'loading':
                return <p>Loading...</p>;
            case 'error':
                return <p>Error fetching data</p>;
            case 'success':
                return (
                    <div className="content__books">
                        <BookSection title="Recently added books" books={data}/>
                    </div>
                );
        }
    }
    
    return (
        <>
            <HeroBanner/>
            <SearchInput/>
            {statusHandler(status)}
        </>
    )
}

export default Home;