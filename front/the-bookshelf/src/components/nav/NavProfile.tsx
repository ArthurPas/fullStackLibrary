import { BASE_API_URL } from "@/utils/Constants";
import { Link, useNavigate } from "react-router-dom";
import swal from "sweetalert";
import { FiLogOut } from "react-icons/fi";
import { useEffect, useState } from "react";
import { IoIosArrowDown } from "react-icons/io";

function NavProfile() {
	const navigate = useNavigate();

    const [displayMenu, setDisplayMenu] = useState<boolean>(false);

	const logoutUser = async () => {
		return fetch(`${BASE_API_URL}/logout`, {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify({
				token: localStorage.getItem("accessToken"),
			}),
		}).then((data) => data.json());
	};

	const handleLogout = async () => {
		const response = await logoutUser();

		if (response.message == "success") {
			localStorage.removeItem("accessToken");
			localStorage.removeItem("user");
			swal("Success", "You have been logged out", "success", {
				timer: 2000,
			}).then((value) => {
				window.location.reload();
			});
		} else {
			console.log(localStorage.getItem("accessToken"));
		}
	};

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
                    <a onClick={handleLogout}>
                        <FiLogOut />
                        Logout
                    </a>
                </ul>
            ) : null }
		</div>
	);
}

export default NavProfile;
