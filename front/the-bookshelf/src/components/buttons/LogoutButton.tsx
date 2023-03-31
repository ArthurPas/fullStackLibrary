import { BASE_API_URL } from "@/utils/Constants";
import { FiLogOut } from "react-icons/fi";

/**
 * @component Logout - A button to logout the user
 * 
 * @returns {JSX.Element} - The Logout component
 * 
 * @example <Logout/>
 */
function Logout() {

	/**
	 * @function logoutUser - Logout the user by sending a POST request to
	 * the API containing the accessToken
	 * 
	 * @returns {Promise} - The response of the API
	 */
	const logoutUser = async () => {
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

	/**
	 * @function handleLogout - Handle the logout of the user: remove the 
	 * accessToken and user from the localStorage and reload the page
	 */
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