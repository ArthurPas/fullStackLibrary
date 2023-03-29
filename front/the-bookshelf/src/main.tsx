import React from "react";
import ReactDOM from "react-dom/client";
import {
	createBrowserRouter,
	RouterProvider,
} from "react-router-dom";
import { ErrorPage } from "@/components";
import { Auth, Home, Root, Search } from "@/routes";
import '@/style/global.scss';

const router = createBrowserRouter([
	{
		path: "/",
		element: <Root/>,
    children: [
      {
        path: "/",
        element: <Home />,
      },
      {
        path: "/login",
        element: <Auth />,
      },
      {
        path: "/search",
        element: <Search />,
      },
      {
        path: "*",
        element: <ErrorPage />,
      }
    ],
  },
]);

ReactDOM.createRoot(document.getElementById("root") as Element).render(
  <React.StrictMode>
      <RouterProvider router={router}/>
  </React.StrictMode>
);