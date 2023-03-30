import { BASE_API_URL } from "@/utils/Constants";
import { useEffect, useState } from "react";
import { useQuery } from "react-query";
import { useNavigate } from "react-router-dom";
import "./_inputs.scss";

interface SearchInputProps {
	queryString?: string;
}

function SearchInput({ queryString }: SearchInputProps) {
	const navigate = useNavigate();

	const [query, setQuery] = useState<string>(queryString == undefined ? "" : queryString);

	const [displayAutocomplete, setDisplayAutocomplete] =
		useState<boolean>(false);

	const { data, status } = useQuery(
		["autocomplete", query],
		() => getAutocomplete(query),
		{ staleTime: 1000 }
	);

	const getAutocomplete = async (query: string) => {
		const response = await fetch(
			`${BASE_API_URL}/autocompletion?debut=${query}`
		);
		if (!response.ok) {
			throw new Error("Something went wrong");
		}

		if (response.status == 204) {
			return [];
		}

		return response.json();
	};

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
