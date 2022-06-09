import { coords3D } from "../types/coords";


export default class MoveableCoord implements coords3D {
    x: number;
    y: number;
    z: number;

    constructor (coord: coords3D) {
        this.x = coord.x;
        this.y = coord.y;
        this.z = coord.z;
    }

    move() {
        
    }
}