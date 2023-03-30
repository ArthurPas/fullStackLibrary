import { BASE_API_URL } from "@/utils/Constants";
import { useEffect, useState } from "react";
import { useQuery } from "react-query";
import { useNavigate } from "react-router-dom";
import "./_inputs.scss";

/**
 * @interface SearchInputProps - Defines the props of the SearchInput component
 * 
 * @property {string} queryString - The query string to search for
 */
interface SearchInputProps {
	queryString?: string;
}

/**
 * @component SearchInput - A search input to search for an author
 * and display the autocomplete results
 * 
 * @param {SearchInputProps} props - The props of the component
 * 
 * @returns {JSX.Element} - The SearchInput component
 * 
 * @example <SearchInput queryString={queryString}/>
 */
function SearchInput({ queryString }: SearchInputProps) {

	// Hook used to switch between pages
	const navigate = useNavigate();

	// State to store the query string
	const [query, setQuery] = useState<string>(queryString == undefined ? "" : queryString);

	// State to tell if the autocomplete results should be displayed or not
	const [displayAutocomplete, setDisplayAutocomplete] =
		useState<boolean>(false);

	// Fetch the autocomplete results when the query string changes
	const { data, status } = useQuery(
		["autocomplete", query],
		() => getAutocomplete(query),
		{ staleTime: 1000 }
	);

	/**
	 * @function getAutocomplete - Fetch the autocomplete results from the API
	 * 
	 * @param {string} query - The query string to search for
	 * 
	 * @returns {Promise<string[]>} - The autocomplete results
	 */
	const getAutocomplete = async (query: string) => {
		const response = await fetch(
			`${BASE_API_URL}/autocompletion?startby=${query}`
		);
		if (!response.ok) {
			throw new Error("Something went wrong");
		}

		if (response.status == 204) {
			return [];
		}

		return response.json();
	};

	/**
	 * @function handleSearch - Handle the search when the user submits the form (SearchInput button)
	 * 
	 * @param {React.FormEvent<HTMLFormElement>} e - The form event
	 */
	const handleSearch = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        if (query == "" || query == queryString) return;
        navigate(`/search?q=${query}`);
        if (location.pathname == "/search") window.location.reload();
    };

	return (
		<form className="input__search" onSubmit={handleSearch}>
			<input
				type="text"
				placeholder="Type an author..."
				value={query}
				onChange={(e) => {
					setQuery(e.target.value);
					setDisplayAutocomplete(data);
				}}
			/>
			{data && data.length != 0 && displayAutocomplete ? (
				<ul className="autocomplete">
					{data.map((item: any, index: number) => {
						return (
							<li
								key={index}
								onClick={() => {
									setQuery(item.authorName);
									setDisplayAutocomplete(false);
								}}>
								{item.authorName}
							</li>
						);
					})}
				</ul>
			) : null}
			<input className="btn__primary" type="submit" value="Search" />
		</form>
	);
}

export default SearchInput;
