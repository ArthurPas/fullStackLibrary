import AuthForm from "@/components/forms/AuthForm";
import { useState } from "react";
import swal from "sweetalert";
import { BASE_API_URL } from "@/utils/Constants";
import { useNavigate } from "react-router-dom";

function Auth() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    const navigate = useNavigate();

    async function loginUser(credentials: { email: string; password: string; }) {
      return fetch(`${BASE_API_URL}/login`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(credentials)
      })
        .then(data => data.json())
     }
    
    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();

        const response = await loginUser({email, password});

        if ('accessToken' in response) {
          const user = response['user'];
          swal("Connected !", `Welcome back, ${user.firstname} ${user.lastname}`, "success", {
            timer: 2000,
          })
          .then((value) => {
            localStorage.setItem('accessToken', response['accessToken']);
            localStorage.setItem('user', JSON.stringify(response['user']));
            navigate('/');
          });
        } else {
          swal("Invalid credentials", "If the error persists, please refresh the page.", "error");
        }    
      }

    return (
        <AuthForm setEmail={setEmail} setPassword={setPassword} onSubmit={handleSubmit}/>
    )
}

export default Auth;