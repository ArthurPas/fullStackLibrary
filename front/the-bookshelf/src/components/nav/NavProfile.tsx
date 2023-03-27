import { BASE_API_URL } from "@/main";
import { Link, useNavigate } from "react-router-dom";

function NavProfile() {

    const navigate = useNavigate();

    const logoutUser = async () => {
        return fetch(`${BASE_API_URL}/logout`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                token: localStorage.getItem('accessToken')
            })
        })
        .then(data => data.json())
    }

    const handleLogout = async () => {

        const response = await logoutUser();

        if (response.message == "success") {
            localStorage.removeItem('accessToken');
            localStorage.removeItem('user');
            window.location.reload();
        } else {
            console.log(localStorage.getItem('accessToken'))
        }
    }

    return (
        <div className="nav__profile">
            <div>
                <img src={JSON.parse(localStorage.getItem('user')!).avatar} alt="Profile"/>
                <h3>{localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user')!).firstname : ""}</h3>
            </div>
            <ul className="nav__profile__dropdown">
                <Link to="/profile">Profile</Link>
                <a onClick={handleLogout}>Logout</a>
            </ul>
        </div>
    );
}

export default NavProfile;