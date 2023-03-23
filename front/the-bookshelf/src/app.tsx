import { createBrowserRouter, RouterProvider } from "react-router-dom";
import { ErrorPage, Header } from "./components";
import Home from "./routes/home";
import './style/global.scss';

const router = createBrowserRouter([
  {
    path: "/",
    element: <Home/>,
    errorElement: <ErrorPage/>
  }
]);

function App() {
    return (
        <div className="app">
            <Header/>
            <RouterProvider router={router} />
        </div>
    );
}

export default App;