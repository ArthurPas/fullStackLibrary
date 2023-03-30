import { BASE_API_URL } from "@/utils/Constants";
import { FiLogOut } from "react-icons/fi";

function Logout() {
	const logoutUser = async () => {

		console.log( localStorage.getItem("accessToken"))
		return fetch(`${BASE_API_URL}/logout`, {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify({
				token: localStorage.getItem("accessToken"),
			}),
		}).then((data) => data.json());
	};

	const handleLogout = async () => {
		const response = await logoutUser();

		if (response.message == "success logout") {
			localStorage.removeItem("accessToken");
			localStorage.removeItem("user");
			window.location.reload();
		}
	};

	return (
		<a onClick={handleLogout}>
			<FiLogOut />
			Logout
		</a>
	);
}

export default Logout;