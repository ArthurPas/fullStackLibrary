import AuthForm from "@/components/forms/AuthForm";
import { useState } from "react";
import swal from "sweetalert";
import { BASE_API_URL } from "@/main";

function Auth() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    
    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();

        const response = await loginUser({email, password});

        if ('accessToken' in response) {
          swal("Success", response.message, "success", {
            timer: 2000,
          })
          .then((value) => {
            localStorage.setItem('accessToken', response['accessToken']);
            localStorage.setItem('user', JSON.stringify(response['user']));
          });
        } else {
          swal("Failed", response.message, "error");
        }
        
      }

    return (
        <AuthForm setEmail={setEmail} setPassword={setPassword} onSubmit={handleSubmit}/>
    )
}

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

export default Auth;