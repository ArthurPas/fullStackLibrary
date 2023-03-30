import { Link } from "react-router-dom";
import { FiArrowLeft } from "react-icons/fi";
import "./_buttons.scss";

function BackToHome() {
    
    return (
        <Link to={"/"} className="btn__text" ><FiArrowLeft/> Back to home</Link>
    )
}

export default BackToHome;