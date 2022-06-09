import Player, { PlayerData } from "./Player";
import crypto from "crypto";

export interface GameData {
    name: string;
}

export default class Game {
    id: string;
    players: Array<Player>;
    data: GameData;

    constructor(data: GameData) {
        this.id = crypto.randomUUID({disableEntropyCache : true});
        this.players = [];
        this.data = data;
    }

    throwError(message: string): void {
        throw new Error(`Game ${this.data.name} (${this.id}): ${message}`);
    }

    addPlayer(playerData: PlayerData): Player {
        const playerCreated = new Player(this, playerData);
        this.players.push(playerCreated);
        return playerCreated;
    }

    removePlayer(id: string): void {
        const playerIndexToRemove: number = this.players.findIndex(player=>player.id==id);
        if(playerIndexToRemove >= 0) {
            this.players.splice(playerIndexToRemove, 1);
        } else {
            this.throwError(`no player with this id (${id})`);
        }
    }
}