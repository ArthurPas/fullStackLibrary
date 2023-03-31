import { Link } from "react-router-dom";
import { FiArrowLeft } from "react-icons/fi";
import "./_buttons.scss";

/**
 * @component BackToHome - Display a button to go back to the home page
 * 
 * @returns {JSX.Element} - The BackToHome component
 * 
 * @example <BackToHome/>
 */
function BackToHome() {
    
    return (
        <Link to={"/"} className="btn__text" ><FiArrowLeft/> Back to home</Link>
    )
}

export default BackToHome;