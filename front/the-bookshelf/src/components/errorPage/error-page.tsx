// @ts-nocheck File not supported by TS

import { useRouteError } from "react-router-dom";
import "@lottiefiles/lottie-player";
import "./_error-page.scss";
import { Link } from "react-router-dom";
import { FiArrowLeft } from "react-icons/fi";

function ErrorPage() {
	const error = useRouteError();

	return (
        <div className="error__page">
            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
            <lottie-player src="https://lottie.host/fd99542c-f6f6-4485-af0d-67f38f67e99d/uguhyM3eny.json" autoplay loop mode="normal"/>
            <Link to={"/"} className="btn__text" ><FiArrowLeft/> Back to home</Link>
        </div>
    )
}

export default ErrorPage;
