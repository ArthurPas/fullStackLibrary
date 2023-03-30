import { Link } from "react-router-dom";
import Logo from "../../assets/logo-iut.svg";
import NavProfile from "./NavProfile";
import "./_nav.scss";

/**
 * @component Nav - Display the navigation bar of the website
 * 
 * @returns {JSX.Element} - The Nav component
 * 
 * @example <Nav/>
 */
function Nav() {

	/**
	 * @function handleRefresh - Refresh the page when the user click 
	 * on the logo when on the home page.
	 */
	const handleRefresh = () => {
		if (location.pathname != "/")return;
		window.location.reload();
	}

	return (
		<nav>
			<Link to={"/"} onClick={handleRefresh} className="nav__logo">
				<img src={Logo} alt="Logo IUT" />
				<h1>The Bookshelf</h1>
			</Link>
			<ul className="nav__items">
				<Link to="/" className="nav__item">Home</Link>
				{ !localStorage.getItem('accessToken') ? (
					<Link to={"/login"} className="nav__item btn__secondary">Login</Link>
				) : (
					<>
						<Link to="/follows" className="nav__item">Friends</Link>
						<NavProfile	/>
					</>
				)}
			</ul>
		</nav>
	);
}

export default Nav;
