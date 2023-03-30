import { BASE_API_URL } from "@/utils/Constants";
import { User } from "@/utils/Types";
import { useEffect, useState } from "react";
import { FaUserAlt } from "react-icons/fa";
import { MdAlternateEmail } from "react-icons/md";
import { useQuery } from "react-query";
import BookCard from "../books/BookCard";
import FollowButton from "../buttons/FollowButton";
import "./_user-card.scss";

interface UserCardProps {
    user: User;
    following: boolean;
}

function UserCard({ user, following }: UserCardProps) {

    const [isFollowing, setIsFollowing] = useState<boolean>(following);

    const { data: borrowedBooks, status } = useQuery(["borrowedBooks", user.email], () => fetchBorrowedBooks());

    const fetchBorrowedBooks = async () => {
        const response = await fetch(`${BASE_API_URL}/borrow/user/${user.email}`);

        if (!response.ok) {
            throw new Error("Something went wrong");
        }

        return await response.json();
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