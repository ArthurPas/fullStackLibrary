import AuthInputFields from "@/utils/InputFieldType";
import { camelize } from "@/utils/UtilsFunctions";
import "./_inputs.scss";

/**
 * @interface AuthInputProps - Defines the props of the AuthInput component
 * 
 * @property {AuthInputFields} type - The type of the input (email, password, ...)
 * @property {Function} handleChange - The function to call when the input value changes
 */
interface AuthInputProps {
	type: AuthInputFields;
	handleChange: (value: string) => void;
}

/**
 * @component AuthInput - Display an input for the authentication form
 * 
 * @param {AuthInputProps} props - The props of the component
 * 
 * @returns {JSX.Element} - The AuthInput component
 * 
 * @example <AuthInput type={AuthInputFields.PASSWORD} handleChange={handleChange}/>
 */
function AuthInput({ type, handleChange }: AuthInputProps) {
	
	return (
		<div className="auth__input">
			<img src={`/src/assets/icons/${type}-icon.svg`} alt={type} />
			<input
				type={ type.toString() || "text"}
				placeholder={camelize(type)}
				onChange={(e) => handleChange(e.target.value)}
			/>
		</div>
	);
}

export default AuthInput;
