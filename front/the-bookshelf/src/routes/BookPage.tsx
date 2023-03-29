import { BASE_API_URL } from "@/utils/Constants";
import { FaFeatherAlt } from "react-icons/fa";
import { useQuery } from "react-query";
import {
	BsFillCalendarDateFill,
	BsBroadcastPin,
	BsFileTextFill,
} from "react-icons/bs";
import { useState } from "react";
import { useNavigate, useParams } from "react-router-dom";

function BookPage() {
	const { id, setId } = useParams();

	const navigate = useNavigate();

	const { data, status } = useQuery("book", () => fetchBookAndAuthor());

	const [book, setBook] = useState<any>();

	const fetchBookAndAuthor = async () => {
		const response = await fetch(`${BASE_API_URL}/book/${id}`);
		if (!response.ok) {
			navigate("/404");
		}
		const book = await response.json();
		const authorResponse = await fetch(
			`${BASE_API_URL}/author/${book[0].idAuthor}`
		);
		if (!authorResponse.ok) {
			navigate("/404");
		}
		const author = await authorResponse.json();
		return { ...book[0], authorName: author[0].authorName };
	};

	if ((data && !book) || data !== book) {
		setBook(data);
	}

	const statusHandler = (status: string) => {
		switch (status) {
			case "loading":
				return <p>Loading...</p>;
			case "error":
				return <p>Error fetching data</p>;
			case "success":
				if (!book) return;
				return (
					<div className="book__infos card__glass">
						<h2 className="book__infos__title">
							📚 <span> {book.title || "No title"} </span>
						</h2>
						<div className="book__infos__content">
							<img
								src={
									book.image ||
									"/src/assets/book-placeholder.png"
								}
								alt=""
							/>
							<div className="book__infos__content__details">
								<div className="book__infos__content__item">
									<FaFeatherAlt /> <h3>Author</h3>
									<p>{book.authorName || "No author"}</p>
								</div>
								<div className="book__infos__content__item">
									<BsFillCalendarDateFill />{" "}
									<h3>Release date</h3>
									<p>{book.releaseDate || "-"}</p>
								</div>
								<div className="book__infos__content__item">
									<BsBroadcastPin /> <h3>Editor</h3>
									<p>{book.editor || "No editor"} </p>
								</div>
								<div className="book__infos__content__item synopsis">
									<div className="book__infos__synopsis">
										<BsFileTextFill /> <h3>Synopsis</h3>
									</div>
									<p>
										{book.description || "No description"}
									</p>
								</div>
							</div>
						</div>
					</div>
				);
		}
	};

	return <>{statusHandler(status)}</>;
}

export default BookPage;
