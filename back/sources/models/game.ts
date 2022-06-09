import { Player } from "./player";
import crypto from "crypto";

export interface GameData {
    name: string;
}

export class Game {
    id: string;
    players: Array<Player>;
    data: GameData;

    constructor(data: GameData) {
        this.id = crypto.randomUUID({disableEntropyCache : true});
        this.players = [];
        this.data = data;
    }
}