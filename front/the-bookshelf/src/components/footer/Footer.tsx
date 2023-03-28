import "./_footer.scss";
import {
	AiFillFacebook,
	AiFillInstagram,
	AiFillLinkedin,
	AiFillYoutube,
	AiOutlineTwitter,
} from "react-icons/ai";
import { GrLanguage } from "react-icons/gr";

function Footer() {
	return (
		<footer>
            <div className="footer__wrapper">
            	<div className="footer__col">
                    <div className="footer__title">The Bookshelf</div>
                    <div className="footer__content">
                        <a>
                            <AiFillFacebook />
                            Facebook
                        </a>
                        <a>
                            <AiFillInstagram /> 
                            Instagram
                        </a>
                        <a>
                            <AiOutlineTwitter />
                            Twitter
                        </a>
                        <a>
                            <AiFillLinkedin /> 
                            LinkedIn
                        </a>
                        <a>
                            <AiFillYoutube /> 
                            Youtube
                        </a>
                    </div>
                </div>
                <div className="footer__col">
                    <div className="footer__title">Get in Touch</div>
                    <div className="footer__content">
                        <a href="">IUT of Bordeaux's website</a>
                        <a href="">Library - University of Bordeaux</a>
                        <a href="">Contact</a>
                    </div>
                </div>
                <div className="footer__col">
                    <div className="footer__title">IUT of Bordeaux</div>
                    <div className="footer__content">
                        <a href="">15 Rue de Naudet - CS 10207</a>
                        <a href="">33175 Gradignan CEDEX</a>
                        <a href="">Phone +33 (0)5 56 84 57 57</a>
                    </div>
                </div>
            </div>
            <div className="footer__bottom">
                <a>Terms of Service</a>
                <p>|</p>
                <a><GrLanguage/> English</a>
             </div>
		</footer>
	);
}

export default Footer;
