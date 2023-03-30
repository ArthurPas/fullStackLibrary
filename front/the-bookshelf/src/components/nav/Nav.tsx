import { Link } from "react-router-dom";
import Logo from "../../assets/logo-iut.svg";
import NavProfile from "./NavProfile";
import "./_nav.scss";

function Nav() {

	function handleRefresh() {
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
