import AuthForm from "@/components/forms/AuthForm";
import { useState } from "react";
import swal from "sweetalert";
import { BASE_API_URL } from "@/utils/Constants";
import { useNavigate } from "react-router-dom";

/**
 * @component Auth - The authentication page
 *
 * @returns {JSX.Element} - The Auth component
 *
 * @example <Auth/>
 */
function Auth() {
	// State to store the email and password
	const [email, setEmail] = useState("");
	const [password, setPassword] = useState("");

	// Hook used to switch between pages
	const navigate = useNavigate();

	/**
	 * @function loginUser - Login the user using a POST request to the API
	 *
	 * @param {string} email - The email of the user
	 * @param {string} password - The password of the user
	 *
	 * @returns {Promise} - The response of the API (the access token if the credentials are valid)
	 */
	const loginUser = async (credentials: {
		email: string;
		password: string;
	}) => {
		return fetch(`${BASE_API_URL}/login`, {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify(credentials),
		}).then((data) => data.json());
	};

	/**
	 * @function handleSubmit - Handle the submit of the form: send a POST request,
	 * display a nice alert according to the response and redirect the user to the 
	 * home page if the credentials are valid.
	 *
	 * @param {React.FormEvent<HTMLFormElement>} e - The event of the form
	 *
	 * @returns {Promise} - The response of the API (the access token if the credentials are valid)
	 */
	const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
		e.preventDefault();

		const response = await loginUser({ email, password });

		if (!("accessToken" in response)) {
			swal(
				"Invalid credentials",
				"If the error persists, please refresh the page.",
				"error"
			);
			return;
		}
		const user = response["user"];

		// SWAL is a library to display a nice alert.
		swal(
			"Connected !",
			`Welcome back, ${user.firstname} ${user.lastname}`,
			"success",
			{
				timer: 2000,
			}
		).then((value) => {
			localStorage.setItem("accessToken", response["accessToken"]);
			localStorage.setItem("user", JSON.stringify(response["user"]));
			navigate("/");
		});
	};

	return (
		<AuthForm
			setEmail={setEmail}
			setPassword={setPassword}
			onSubmit={handleSubmit}
		/>
	);
}

export default Auth;
