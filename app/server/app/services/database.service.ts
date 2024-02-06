// import { Reservation } from "@app/interfaces/reservation";
import { Reservation } from "@app/interfaces/reservation";
import { injectable } from "inversify";
import * as pg from "pg";
import "reflect-metadata";

@injectable()
export class DatabaseService {
  public connectionConfig: pg.ConnectionConfig = {
    user: "postgres",
    database: "postgres",
    password: "root",
    port: 5433,          // Attention ! Peut aussi être 5433 pour certains utilisateurs
    host: "localhost",
    keepAlive: true
  };

  public pool: pg.Pool = new pg.Pool(this.connectionConfig);

  async getAllReservations() {
    const client = await this.pool.connect();
    const result = await client.query('SELECT * FROM carpooling.Reservation;');
    client.release();
    return result.rows;
  }

  async createReservation(reservation: Reservation){
    const client = await this.pool.connect();
    const query = `
      INSERT INTO carpooling.Reservation (reservationid, reservationstart, reservationend, exigencessup, vehiculeid, mid)
      VALUES ($1, $2, $3, $4, $5, $6)
      RETURNING *
    `;
    const values = [
      reservation.reservationid,
      reservation.reservationstart,
      reservation.reservationend,
      reservation.exigencessup,
      reservation.vehiculeid,
      reservation.mid
    ];
    const result = await client.query(query, values);
    client.release();
    return result;
  }

  async searchMember(member: string){
    const client = await this.pool.connect();
    const result = await client.query(`SELECT * FROM carpooling.Membre WHERE LOWER(prenom) LIKE LOWER('%${member}%') OR LOWER(nom) LIKE LOWER('%${member}%');`);    
    client.release();
    return result.rows;
  }

  async getAllLocations(){
    const client = await this.pool.connect();
    const result = await client.query('SELECT nomEmplacement FROM carpooling.Emplacement;');
    client.release();
    return result.rows;
  }

  async getAllCoopMembers(){
    const client = await this.pool.connect();
    const result = await client.query('SELECT * FROM carpooling.Membre WHERE mid IN (SELECT mid FROM carpooling.MembreCoop);');
    client.release();
    return result.rows;
  }

    async getAllCarpoolingMembers(){
    const client = await this.pool.connect();
    const result = await client.query('SELECT * FROM carpooling.Membre WHERE mid IN (SELECT mid FROM carpooling.MembreAutopartage);');
    client.release();
    return result.rows;
    }

    async getAllVehicles(){
    const client = await this.pool.connect();
    const result = await client.query('SELECT * FROM carpooling.Vehicule;');
    client.release();
    return result.rows;
    }

    async getLastReservation(){
    const client = await this.pool.connect();
    const result = await client.query('SELECT * FROM carpooling.Reservation ORDER BY reservationid DESC LIMIT 1;');
    client.release();
    return result.rows;
    }

    async getAllTypeVehicule(){
      const client = await this.pool.connect();
      const result = await client.query('SELECT * FROM carpooling.TypeVehicule;');
      client.release();
      return result.rows;
      }
}
