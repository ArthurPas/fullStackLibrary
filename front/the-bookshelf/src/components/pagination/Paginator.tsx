import { MouseEventHandler } from "react";
import "./_paginator.scss";


interface PaginatorProps {
    currentPage: number;
    totalPages: number;
    /*
    handlePrevPage: MouseEventHandler;
    handleNextPage: MouseEventHandler;
    */
    booksPerPage: number;
    totalItems: number;
    currentBooks: number;
};

function Paginator({ currentPage, totalPages, //handlePrevPage, handleNextPage,
    booksPerPage, totalItems, currentBooks }: PaginatorProps) {
    return (
        <div className="section__paginator">
            {currentPage > 1 && (
                <button>
                    Précédent
                </button>
            )}
            {currentBooks === 10 && (
                <span>{currentPage * booksPerPage - booksPerPage + 1} ... {currentPage * booksPerPage > totalItems ? totalItems : currentPage * booksPerPage} / {totalItems}</span>
            )}
            {currentBooks < 10 && (
                <span>{currentPage * booksPerPage - booksPerPage + 1} ... {currentPage * booksPerPage - booksPerPage + currentBooks} / {currentPage * booksPerPage - booksPerPage + currentBooks}</span>
            )}
            {currentPage < totalPages && currentBooks === 10 && (
                <button>
                    Suivant
                </button>
            )}
        </div>
    );
};

export default Paginator;