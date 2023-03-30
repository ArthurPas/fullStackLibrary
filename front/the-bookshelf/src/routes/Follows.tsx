import { UserCard } from "@/components";
import { BASE_API_URL } from "@/utils/Constants";
import { User } from "@/utils/Types";
import { useState } from "react";
import { useQuery } from "react-query";

function Follows() {

    const [follows, setFollows] = useState<any>([]);

    const [user , setUser] = useState<User>(JSON.parse(localStorage.getItem("user")!));

    const { data, status } = useQuery("follows", () => fetchFollows());

    const { data: recommendations, status: statusrecommendations } = useQuery("recommendations", () => fetchrecommendations(), {
        enabled: localStorage.getItem("accessToken") ? true : false,
        refetchOnWindowFocus: false,
    });

    const fetchrecommendations = async () => {
        const response = await fetch(`${BASE_API_URL}/recommendation?idUser=${user.idUser}`);

        if (!response.ok) {
            throw new Error("Something went wrong");
        }

        return await response.json();
    }

    const fetchFollows = async () => {
        const response = await fetch(`${BASE_API_URL}/follow/${user.idUser}`);

        if (!response.ok) {
            throw new Error("Something went wrong");
        }

        return await response.json();
    }

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
                        console.log(follow)
                        return (
                            <UserCard user={follow} key={follow.idUser} following={true}/>
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
                                <UserCard user={recommendation} key={recommendation.id_user} following={false}/>
                            );
                        })}
                    </div>
                </div>
            )}
        </>
    )

}

export default Follows;