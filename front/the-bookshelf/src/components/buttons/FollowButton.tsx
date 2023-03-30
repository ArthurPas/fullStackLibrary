import { BASE_API_URL } from "@/utils/Constants";
import { User } from "@/utils/Types";
import { useState } from "react";
import { FiUserPlus, FiUserMinus } from "react-icons/fi";

/**
 * @interface FollowButtonProps - The props for the FollowButton component
 * 
 * @property {User} targetUser - The user to follow/unfollow
 * @property {boolean} following - Whether the user is following the targetUser or not
 * @property {function} setFollowing - A function to set the following state
 */
interface FollowButtonProps {
    targetUser: User;
    following: boolean;
    setFollowing: (following: boolean) => void;
}

/**
 * @component FollowButton - A button to follow/unfollow a user
 * 
 * @param {FollowButtonProps} props - The props for the FollowButton component
 * 
 * @returns {JSX.Element} - The FollowButton component
 * 
 * @example <FollowButton targetUser={user} following={following} setFollowing={setFollowing}/>
 */
function FollowButton({ targetUser, following, setFollowing }: FollowButtonProps) {

    const [user, setUser] = useState<User>(JSON.parse(localStorage.getItem("user")!));

    const followHandler = async () => {
        const response = await fetch(`${BASE_API_URL}/${following ? "unfollow" : "addfollow"}?idUser=${user.idUser}&idUserFollowed=${targetUser.idUser}`, {
            method: following ? "DELETE" : "GET",
        });
    
        if (!response.ok) {
            throw new Error("Something went wrong");
        }

        setFollowing(!following);
        
        return response.json()
    }

    return (
        <>
            {following ? (
                <button className="follow__button red" onClick={followHandler}><FiUserMinus/>Unfollow</button>
            ) : (
                <button className="follow__button" onClick={followHandler}><FiUserPlus/>Follow</button>
            )}
        </>
    )
}

export default FollowButton;