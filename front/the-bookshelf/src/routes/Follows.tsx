import { UserCard } from "@/components";
import { BASE_API_URL } from "@/utils/Constants";
import { User } from "@/utils/Types";
import { useState } from "react";
import { useQuery } from "react-query";

function Follows() {

    const [follows, setFollows] = useState<any>([]);

    const [user , setUser] = useState<User>(JSON.parse(localStorage.getItem("user")!));

    const { data, status } = useQuery("follows", () => fetchFollows());

    const { data: recommandations, status: statusRecommandations } = useQuery("recommandations", () => fetchRecommandations());

    const fetchRecommandations = async () => {
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
                        return (
                            <UserCard user={follow} key={follow.idUser} following={true}/>
                        );
                    })
                );
        }
    }

    return (
        <div className="follows__list">
            {statusHandler(status)}
            {statusRecommandations == "success" && (
                <div className="follows__recommandations">
                    <h2>Recommandations</h2>
                    {recommandations.map((recommandation: User) => {
                        return (
                            <UserCard user={recommandation} key={recommandation.idUser} following={false}/>
                        );
                    })}
                </div>
            )}
        </div>
    )

}

export default Follows;