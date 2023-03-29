import { SearchInput } from "@/components";
import BookCard from "@/components/books/BookCard";
import { BASE_API_URL } from "@/utils/Constants";
import { useState } from "react";
import { useQuery } from "react-query";
import { useSearchParams } from "react-router-dom";

function Search() {
	const [query, setQuery] = useSearchParams();

	const [index, setIndex] = useState<number>(0);

	const { data, status } = useQuery("books", () => searchBooks(20));

	const searchBooks = async (nbBooks: number) => {
		const response = await fetch(
			`${BASE_API_URL}/books?author=${query.get("q")}&type=DESC`
		);

		if (!response.ok) {
			throw new Error("Something went wrong");
		}

		return response.json();
	};

	const handleSearch = (e: React.FormEvent<HTMLFormElement>) => {
		e.preventDefault();
		setIndex(0);
	};

	const statusHandler = (status: string) => {
		switch (status) {
			case "loading":
				return <p>Loading...</p>;
			case "error":
				return <p>Error fetching data</p>;
			case "success":
				// how to check if data is undefined or empty?
				if (data == undefined || data.length == 0) {
					return (
                            <div className="books__no__results">
                                <p>No books found for "{query.get("q")}"</p>
                            </div>
                            );
				}
				return (
					<>
						<p>Results for "{query.get("q")}"</p>
						<div className="book__grid">
							{data.map((book: any, index: number) => {
								return <BookCard key={index} book={book} />;
							})}
						</div>
					</>
				);
		}
	};

	return (
		<>
			<SearchInput queryString={"" + query.get("q")} />
			{statusHandler(status)}
		</>
	);
}

export default Search;
