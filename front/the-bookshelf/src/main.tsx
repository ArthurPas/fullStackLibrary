import React from "react";
import ReactDOM from "react-dom/client";
import {
	createBrowserRouter,
	RouterProvider,
} from "react-router-dom";
import { ErrorPage } from "./components";
import { Auth, Home, Root } from "./routes";
import './style/global.scss';

export const BASE_API_URL = "https://127.0.0.1:8000/api";

const router = createBrowserRouter([
	{
		path: "/",
		element: <Root/>,
		errorElement: <ErrorPage />,
    children: [
      {
        path: "/login",
        element: <Auth />,
      },
      {
        path: "/",
        element: <Home />,
      }
    ],
  },
]);

ReactDOM.createRoot(document.getElementById("root") as Element).render(
  <React.StrictMode>
      <RouterProvider router={router}/>
  </React.StrictMode>
);