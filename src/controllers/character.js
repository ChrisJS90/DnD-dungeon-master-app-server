import { getAllCharacters } from "../domain/character.js";
import { sendDataResponse, sendErrorResponse } from "../utils/responses.js";

export const getAll = async (req, res) => {
    const characters = await getAllCharacters();
    return sendDataResponse(res, 200, characters)
}