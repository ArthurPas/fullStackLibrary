import AuthInputFields from "@/utils/InputFieldType";
import AuthInput from "./inputs/AuthInput";
import { FiArrowLeft } from "react-icons/fi";
import { Link } from "react-router-dom";
import "./_forms.scss"
import { BackToHomeButton } from "@/components";

/**
 * @interface AuthFormProps - Defines the props of the AuthForm component
 * 
 * @property {Function} setEmail - The function to call when the email input value changes
 * @property {Function} setPassword - The function to call when the password input value changes
 * @property {Function} onSubmit - The function to call when the form is submitted
 */
interface AuthFormProps {
    setEmail: (email: string) => void;
    setPassword: (password: string) => void;
    onSubmit: (e: React.FormEvent<HTMLFormElement>) => void;
}

/**
 * @component AuthForm - Display the authentication form
 * 
 * @param {AuthFormProps} props - The props of the component
 * 
 * @returns {JSX.Element} - The AuthForm component
 *
 * @example <AuthForm setEmail={setEmail} setPassword={setPassword} onSubmit={onSubmit}/>
 */
function AuthForm({setEmail, setPassword, onSubmit}: AuthFormProps) {

    return (
        <form className="auth__form card__glass" onSubmit={(e) => onSubmit(e)}>
            <AuthInput type={AuthInputFields.EMAIL} handleChange={setEmail}/>
            <div className="auth__password">
                <AuthInput type={AuthInputFields.PASSWORD} handleChange={setPassword}/>
                <a className="btn__text" >Forgot password ?</a>
            </div>
            <input className="btn__secondary" type="submit" value="Login"/>
            <BackToHomeButton/>
        </form>
    )

}

export default AuthForm;