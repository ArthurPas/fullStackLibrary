import { SearchInput } from "@/components";
import BookCard from "@/components/books/BookCard";
import { BASE_API_URL } from "@/utils/Constants";
import { useState } from "react";
import { useQuery } from "react-query";
import { useSearchParams } from "react-router-dom";

/**
 * @component Search - Search page to search for an author and display the results
 * 
 * @returns {JSX.Element} - The Search component
 * 
 * @example <Search/>
 */
function Search() {

	// Hook used to get the query string from the URL
	const [query, setQuery] = useSearchParams();

	// State to handle the pagination (not implemented yet)
	const [index, setIndex] = useState<number>(0);

	// Fetch the books when the query string changes
	const { data, status } = useQuery("books", () => searchBooks(20));

	/**
	 * @function searchBooks - Fetch the books from the API for the given author
	 * 
	 * @param {number} nbBooks - The number of books to fetch
	 * 
	 * @returns {Promise<any[]>} - The books from the author in the query string
	 */
	const searchBooks = async (nbBooks: number) => {
		const response = await fetch(
			`${BASE_API_URL}/books?author=${query.get("q")}&type=DESC`
		);

		if (!response.ok) {
			throw new Error("Something went wrong");
		}

		return response.json();
	};

	/**
	 * @function handleSearch - Handle the search form submission
	 * 
	 * @param {React.FormEvent<HTMLFormElement>} e - The form event
	 */
	const handleSearch = (e: React.FormEvent<HTMLFormElement>) => {
		e.preventDefault();
		setIndex(0);
	};

	/**
	 * @function statusHandler - Handle the status of the query
	 * 
	 * @param {string} status - The status of the query
	 * 
	 * @returns {JSX.Element} - The JSX element to display depending on the status
	 */
	const statusHandler = (status: string) => {
		switch (status) {
			case "loading":
				return <p>Loading...</p>;
			case "error":
				return <p>Error fetching data</p>;
			case "success":
				if (data.length == 0 || !(data instanceof Array)) {
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
								return <BookCard key={index} book={book} small={false} />;
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
