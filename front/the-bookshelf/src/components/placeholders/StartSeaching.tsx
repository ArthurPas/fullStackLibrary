import "@lottiefiles/lottie-player";
import "./_placeholder.scss";

function StartSearching() {

    return (
        <div className="placeholder">

            <h1>Start searching an author !</h1>
            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

            {/* @ts-ignore */}
            <lottie-player src="https://assets1.lottiefiles.com/private_files/lf30_x8aowqs9.json" speed="0.1" loop autoplay/>
        </div>
    )
}

export default StartSearching;