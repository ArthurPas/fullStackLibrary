import AuthInputFields from "@/utils/InputFieldType";
import { camelize } from "@/utils/UtilsFunctions";
import "./_inputs.scss";

interface AuthInputProps {
	type: AuthInputFields;
	handleChange: (value: string) => void;
}

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
