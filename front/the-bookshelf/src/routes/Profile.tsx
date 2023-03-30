import { useState } from "react";
import { FaUserAlt } from "react-icons/fa";
import { MdAlternateEmail } from "react-icons/md";
import { BackToHomeButton } from "@/components";
import { User } from "@/utils/Types";

function Profile() {

    const [currentUser, setCurrentUser] = useState<User>(JSON.parse(localStorage.getItem('user')!));

    return (
        <>
            {currentUser && (
                <div className="profile__infos card__glass">
                    <img src={currentUser.avatar} alt="" />
                    <div className="profile__content">
                        <h2><FaUserAlt/> {currentUser.firstname} {currentUser.lastname}</h2>
                        <p><MdAlternateEmail/>{currentUser.email}</p>
                    </div>
                </div>
            )}
            <BackToHomeButton/>
        </>
    )

}

export default Profile;