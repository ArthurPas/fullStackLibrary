import { BASE_API_URL } from "@/utils/Constants";
import { User } from "@/utils/Types";
import { useState } from "react";
import { FiUserPlus, FiUserMinus } from "react-icons/fi";

interface FollowButtonProps {
    targetUser: User;
    following: boolean;
    setFollowing: (following: boolean) => void;
}

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