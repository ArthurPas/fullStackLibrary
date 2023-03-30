import { useRouteError } from "react-router-dom";
import "@lottiefiles/lottie-player";
import "./_error-page.scss";
import BackToHome from "../buttons/BackToHomeButton";

function ErrorPage() {
	const error = useRouteError();

	return (
        <div className="error__page">
            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

            {/* @ts-ignore */}
            <lottie-player src="https://lottie.host/fd99542c-f6f6-4485-af0d-67f38f67e99d/uguhyM3eny.json" autoplay loop mode="normal"/>

            <BackToHome/>
        </div>
    )
}

export default ErrorPage;
