import Logo from '../../assets/logo-iut.svg';
import './_header.scss';

function Header() {
        
    return (
        <header className="header">
            <div className="header__logo">
                <img src={Logo} alt="Logo IUT" />
                <h1>The Bookshelf</h1>
            </div>
            <ul className="header__nav">
                <li className="header nav__item">Home</li>
                <li className="header nav__item">Friends</li>
                <li className="header nav__item btn__secondary">Login</li>
            </ul>
        </header>
    )
}

export default Header;