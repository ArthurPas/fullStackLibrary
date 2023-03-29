import { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./_inputs.scss";

interface SearchInputProps {
    queryString?: string;
}

function SearchInput({queryString}: SearchInputProps) {

    const navigate = useNavigate();

    const [query, setQuery] = useState<string>(queryString || "");

    const handleSearch = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        console.log(query, queryString)
        if (query == "")return;
        navigate("/search?q=" + query);
        if(location.pathname == "/search") {
            window.location.reload();
        }
    }

    return (
        <form className="input__search" onSubmit={handleSearch}>
            <input type="text" placeholder="Book, author, tag..." value={query} onChange={(e) => setQuery(e.target.value)}/>
            <input className="btn__primary" type="submit" value="Search"/>
        </form>
    )
}

export default SearchInput;