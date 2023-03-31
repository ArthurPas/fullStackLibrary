import { UserCard } from "@/components";
import { BASE_API_URL } from "@/utils/Constants";
import { User } from "@/utils/Types";
import { uID } from "@/utils/UtilsFunctions";
import { useState } from "react";
import { useQuery } from "react-query";

/**
 * @component Follows - A page to display the users followed by the logged in user
 * 
 * @returns {JSX.Element} - The Follows component
 * 
 * @example <Follows/>
 */
function Follows() {

    // Store the logged in user in a state
    const [user , setUser] = useState<User>(JSON.parse(localStorage.getItem("user")!));

    // Fetch the users followed by the logged in user using react-query's useQuery hook
    const { data, status } = useQuery("follows", () => fetchFollows());

    // Get recommandations of users to follow using react-query's useQuery hook
    const { data: recommendations, status: statusrecommendations } = useQuery("recommendations", () => fetchRecommendations(), {
        enabled: localStorage.getItem("accessToken") ? true : false,
        refetchOnWindowFocus: false,
    });

    /**
     * @function fetchRecommendations - Fetch recommendations of users to follow
     * details: the recommanded users are not already followed by the logged in user
     * 
     * @returns {Promise<User[]>} - The users to follow
     */
    const fetchRecommendations = async () => {
        const response = await fetch(`${BASE_API_URL}/recommendation?idUser=${user.idUser}`);

        if (!response.ok) {
            throw new Error("Something went wrong");
        }

        return await response.json();
    }

    /**
     * @function fetchFollows - Fetch the users followed by the logged in user
     * 
     * @returns {Promise<User[]>} - The users followed by the logged in user
     */
    const fetchFollows = async () => {
        const response = await fetch(`${BASE_API_URL}/follow/${user.idUser}`);

        if (!response.ok) {
            throw new Error("Something went wrong");
        }

        return await response.json();
    }

    /**
     * @function statusHandler - Handle the status of the fetch request
     * 
     * @param {string} status - The status of the fetch request
     * 
     * @returns {JSX.Element} - The JSX element to display according to the status
     */
    const statusHandler = (status: string) => {
        switch (status) {
            case "loading":
                return <p>Loading...</p>;
            case "error":
                return <p>Error fetching data</p>;
            case "success":
                if (data.length == 0) {
                    return <p>You don't follow anyone</p>;
                }
                return (
                    data.map((follow: User) => {
                        return (
                            <UserCard user={follow} key={uID.next().value as number} following={true}/>
                        );
                    })
                );
        }
    }

    return (
        <>
            <div className="follows__list">
                {statusHandler(status)}
            </div>
            {statusrecommendations == "success" && (
                <div className="follows__recommendations">
                    <h2>recommendations</h2>
                    <div className="recommendations__grid">
                        {recommendations.map((recommendation: any) => {
                            return (
                                <UserCard user={recommendation} key={uID.next().value as number} following={false}/>
                            );
                        })}
                    </div>
                </div>
            )}
        </>
    )

}

export default Follows;