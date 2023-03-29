import { Link, useNavigate } from "react-router-dom";
import { FiLogOut } from "react-icons/fi";
import { useEffect, useState } from "react";
import { IoIosArrowDown } from "react-icons/io";
import { LogoutButton } from "@/components";

function NavProfile() {
	const navigate = useNavigate();

    const [displayMenu, setDisplayMenu] = useState<boolean>(false);

    const handleClickOutside = (event: any) => {
        if (displayMenu && !document.querySelector('.nav__profile')?.contains(event.target)) {
            setDisplayMenu(false);
        }
    }

    useEffect(() => {
        document.addEventListener("click", handleClickOutside);
        return () => {
            document.removeEventListener("click", handleClickOutside);
        }
    }, [displayMenu]);


	return (
		<div className="nav__profile">
			<div onClick={() => setDisplayMenu(!displayMenu)}>
				<img
					src={JSON.parse(localStorage.getItem("user")!).avatar}
					alt="Profile"
				/>
				<h3>
					{localStorage.getItem("user")
						? JSON.parse(localStorage.getItem("user")!).firstname
						: ""}
                    <IoIosArrowDown />
				</h3>
			</div>
            { displayMenu ? (
                <ul className="nav__profile__dropdown">
                    <h5>
                        <img
                            src={JSON.parse(localStorage.getItem("user")!).avatar}
                            alt="Profile"
                        />
                        <div>
                            <p>{JSON.parse(localStorage.getItem("user")!).email}</p>
                            <Link to="/profile" onClick={() => setDisplayMenu(!displayMenu)}>View Profile</Link>
                        </div>
                    </h5>
                    <hr />
                    <LogoutButton />
                </ul>
            ) : null }
		</div>
	);
}

export default NavProfile;
