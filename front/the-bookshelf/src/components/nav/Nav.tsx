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
				<li><Link to="/" className="nav__item">Home</Link></li>
				{ !localStorage.getItem('accessToken') ? (
					<li><Link to={"/login"} className="nav__item btn__secondary">Login</Link></li>
				) : (
					<>
						<li><Link to="/follows" className="nav__item">Friends</Link></li>
						<li><NavProfile	/></li>
					</>
				)}
			</ul>
		</nav>
	);
}

export default Nav;
