import "@lottiefiles/lottie-player";
import "./_error-page.scss";
import BackToHome from "../buttons/BackToHomeButton";

/**
 * @component ErrorPage - Display a page when an error occurs
 * 
 * @returns {JSX.Element} - The ErrorPage component
 * 
 * @example <ErrorPage/>
 */
function ErrorPage() {

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
