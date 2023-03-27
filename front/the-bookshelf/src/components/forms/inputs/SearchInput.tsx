import "./_inputs.scss";

function SearchInput() {

    return (
        <div className="input__search">
            <input type="text" placeholder="Book, author, tag..."/>
            <a className="btn__primary" type="submit">Search</a>
        </div>
    )
}

export default SearchInput;