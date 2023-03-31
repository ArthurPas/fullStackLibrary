import React from "react";
import ReactDOM from "react-dom/client";
import {
	createBrowserRouter,
	RouterProvider,
} from "react-router-dom";
import { ErrorPage } from "@/components";
import { Auth, Home, Root, Search, BookPage, Profile, Follows, TermsOfService } from "@/routes";
import '@/style/_global.scss';

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
        path: "/book/:id",
        element: <BookPage />,
      },
      {
        path: "/profile",
        element: <Profile />,
      },
      {
        path: "/follows",
        element: <Follows />,
      },
      {
        path: "/tos",
        element: <TermsOfService />,
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