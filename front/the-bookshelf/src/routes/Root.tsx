import { Outlet } from "react-router-dom";
import { Nav, Footer } from "../components";
import { useLocation, Link } from 'react-router-dom'
import Logo from "@/assets/logo-iut.svg";

import { QueryClient, QueryClientProvider } from 'react-query'

const queryClient = new QueryClient()

/**
 * @component Root - Display the layout of the website, the navigation bar and the footer
 * 
 * @returns {JSX.Element} - The Root component (the layout)
 * 
 * @example <Root/>
 */
function Root() {

    // Hook used to get the current location (route)
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
            {(location.pathname != "/login") ? <Footer/> : null}
        </QueryClientProvider>
    )

}

export default Root;