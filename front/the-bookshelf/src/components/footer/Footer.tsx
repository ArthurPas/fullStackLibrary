import "./_footer.scss";
import {
	AiFillFacebook,
	AiFillInstagram,
	AiFillLinkedin,
	AiFillYoutube,
	AiOutlineTwitter,
} from "react-icons/ai";
import { GrLanguage } from "react-icons/gr";
import { Link } from "react-router-dom";

function Footer() {
	return (
		<footer>
            <div className="footer__wrapper">
            	<div className="footer__col">
                    <div className="footer__title">The Bookshelf</div>
                    <div className="footer__content">
                        <a href="https://www.facebook.com/iutdebordeaux">
                            <AiFillFacebook />
                            Facebook
                        </a>
                        <a href="https://www.instagram.com/iutdebordeaux/">
                            <AiFillInstagram /> 
                            Instagram
                        </a>
                        <a href="https://twitter.com/IUT_de_Bordeaux">
                            <AiOutlineTwitter />
                            Twitter
                        </a>
                        <a href="https://www.linkedin.com/school/iut-de-bordeaux">
                            <AiFillLinkedin /> 
                            LinkedIn
                        </a>
                        <a href="https://www.youtube.com/channel/UCaWP9UzIsK3H9NKx9AruRdA">
                            <AiFillYoutube /> 
                            Youtube
                        </a>
                    </div>
                </div>
                <div className="footer__col">
                    <div className="footer__title">Get in Touch</div>
                    <div className="footer__content">
                        <a href="https://www.iut.u-bordeaux.fr/general/">IUT of Bordeaux's website</a>
                        <a href="https://bibliotheques.u-bordeaux.fr/Les-bibliotheques/Sciences-et-Technologies/Bibliotheque-de-l-IUT-de-Bordeaux">Library - University of Bordeaux</a>
                        <a href="https://www.iut.u-bordeaux.fr/general/contacts/">Contact</a>
                    </div>
                </div>
                <div className="footer__col">
                    <div className="footer__title">IUT of Bordeaux</div>
                    <div className="footer__content">
                        <p>15 Rue de Naudet - CS 10207</p>
                        <p>33175 Gradignan CEDEX</p>
                        <p>Phone +33 (0)5 56 84 57 57</p>
                    </div>
                </div>
            </div>
            <div className="footer__bottom">
                <a>Terms of Service</a>
                <p>|</p>
                <Link to="/404"><GrLanguage/> English</Link>
             </div>
		</footer>
	);
}

export default Footer;
