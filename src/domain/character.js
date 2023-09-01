import dbClient from "../utils/dbClient.js";

export async function getAllCharacters() {
    return await dbClient.character.findMany({
        include: {
            stats: true,
            savingThrows: true,
            skills: true,
            combat: true
        }
    })
}