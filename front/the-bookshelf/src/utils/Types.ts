export type User = {
    id: number;
    firstname: string;
    lastname: string;
    email: string;
    avatar: string;
}

export type Book = {
    idBook: number;
    title: string;
    image: string;
    description: string;
    numberOfPages: number;
    editor: string;
    releaseDate: string;
    authors: string;
}