import { Link } from "react-router-dom";
import Logo from "../../assets/logo-iut.svg";
import NavProfile from "./NavProfile";
import "./_nav.scss";

function Nav() {
	return (
		<nav>
			<Link to={"/"} className="nav__logo">
				<img src={Logo} alt="Logo IUT" />
				<h1>The Bookshelf</h1>
			</Link>
			<ul className="nav__items">
				<li className="nav__item">Home</li>
				<li className="nav__item">Friends</li>
				{ !localStorage.getItem('accessToken') ? (
					<Link to={"/login"} className="nav__item btn__secondary">Login</Link>
				) : (
					<NavProfile	/>
				)}
			</ul>
		</nav>
	);
}

export default Nav;
