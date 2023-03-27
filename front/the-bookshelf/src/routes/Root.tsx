import { Outlet } from "react-router-dom";
import { Nav } from "../components";
import { useLocation, Link } from 'react-router-dom'
import Logo from "@/assets/logo-iut.svg";

import { QueryClient, QueryClientProvider } from 'react-query'

const queryClient = new QueryClient()

function Root() {

    const location = useLocation();

    return (
        <QueryClientProvider client={queryClient}>
            {location.pathname != "/login" ? <Nav/> : 
            <nav className="login__nav">
                <Link to={"/"} className="nav__logo">
                    <img src={Logo} alt="Logo IUT" />
                    <h1>The Bookshelf</h1>
                </Link>
            </nav>
            } 
            <Outlet/>
        </QueryClientProvider>
    )

}

export default Root;