import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import { IoIosArrowDown } from "react-icons/io";
import { LogoutButton } from "@/components";

/**
 * @component NavProfile - Display the profile section of the navbar
 * 
 * @returns {JSX.Element} - The NavProfile component
 * 
 * @example <NavProfile/>
 */
function NavProfile() {

    // Tells if the menu profile is displayed or not
    const [displayMenu, setDisplayMenu] = useState<boolean>(false);

    // Handle the click outside the menu (not very clean, sorry :/)
    const handleClickOutside = (event: any) => {
        if (displayMenu && !document.querySelector('.nav__profile')?.contains(event.target)) {
            setDisplayMenu(false);
        }
    }

    // God forgive me for what I've done
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
                    <h2>
                        <img
                            src={JSON.parse(localStorage.getItem("user")!).avatar}
                            alt="Profile"
                        />
                        <div>
                            <p>{JSON.parse(localStorage.getItem("user")!).email}</p>
                            <Link to="/profile" onClick={() => setDisplayMenu(!displayMenu)}>View Profile</Link>
                        </div>
                    </h2>
                    <hr />
                    <LogoutButton />
                </ul>
            ) : null }
		</div>
	);
}

export default NavProfile;
