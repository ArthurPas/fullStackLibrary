import { BASE_API_URL } from "@/utils/Constants";
import { User } from "@/utils/Types";
import { useEffect, useState } from "react";
import { FaUserAlt } from "react-icons/fa";
import { MdAlternateEmail } from "react-icons/md";
import { useQuery } from "react-query";
import BookCard from "../books/BookCard";
import FollowButton from "../buttons/FollowButton";
import "./_user-card.scss";

/**
 * @interface UserCardProps - The props for the UserCard component
 * 
 * @property {User} user - The user to display on the card
 * @property {boolean} following - Whether the user who's logged in is 
 *                                 following the user of the card or not
 */
interface UserCardProps {
    user: User;
    following: boolean;
}

/**
 * @component UserCard - A card to display a user's information
 * 
 * @param {UserCardProps} props - The props for the UserCard component
 * 
 * @returns {JSX.Element} - The UserCard component
 * 
 * @example <UserCard user={user} following={following}/>
 */
function UserCard({ user, following }: UserCardProps) {

    // Tell if the logged in user is following the user of the card
    const [isFollowing, setIsFollowing] = useState<boolean>(following);

    // Fetch the books borrowed by the user of the card using useQuery
    const { data: borrowedBooks } = useQuery(["borrowedBooks", user.email], () => fetchBorrowedBooks());

    /**
     * @function fetchBorrowedBooks - Fetch the books borrowed by the user of the card
     * 
     * @returns {Promise<any>} - The last 3 books borrowed by the user of the card
     */
    const fetchBorrowedBooks = async () => {
        const response = await fetch(`${BASE_API_URL}/borrow/user/${user.email}`);

        if (!response.ok) {
            throw new Error("Something went wrong");
        }

        let booksArray = await response.json();
        if(booksArray.length > 0)booksArray = booksArray.slice(0, 3)

        return booksArray;
    }

    return (
        <>
            {user && (
                <div className="user__card card__glass">
                    <img src={user.avatar || "/src/assets/user-placeholder.png"} alt="" />
                    <h2><FaUserAlt/> {user.firstname} {user.lastname}</h2>
                    <p><MdAlternateEmail/>{user.email}</p>
                    <div>
                        {borrowedBooks && borrowedBooks.length > 0 && (
                            borrowedBooks.map((book: any) => {
                                return (
                                    <BookCard small={true} book={book} key={book.idBook} />
                                )
                            })
                        )}  
                    </div>
                    <FollowButton targetUser={user} following={isFollowing} setFollowing={setIsFollowing}/>
                </div>
            )}        
        </>
    )
}

export default UserCard;