import Game from "./Game";
import crypto from "crypto";

export interface PlayerData {
    name: string;
}
export default class Player {
    game: Game;
    id: string;
    key: string;
    data: PlayerData;

    constructor(game: Game, data: PlayerData) {
        this.game = game;
        this.key = crypto.randomBytes(48).toString('hex')
        this.id = crypto.randomUUID({disableEntropyCache : true});
        this.data = data;
    }

    throwError(message: string): void {
        throw new Error(`Player ${this.data.name} (${this.id}): ${message}`);
    }
}