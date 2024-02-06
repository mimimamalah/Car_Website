import { Router, Request, Response } from "express";
import { inject, injectable } from "inversify";
import { DatabaseService } from "../services/database.service";
import Types from "../types";


@injectable()
export class DatabaseController {
  public constructor(
    @inject(Types.DatabaseService)
    private readonly databaseService: DatabaseService
  ) {}

  public get router(): Router {
    const router: Router = Router();

    router.get('/reservations', this.getReservations.bind(this));

    router.post('/reservation', this.createReservation.bind(this));

    router.get('/search/:nom', this.searchMember.bind(this));

    router.get('/locations', this.getLocations.bind(this));

    router.get('/coopMembers', this.getCoopMembers.bind(this));

    router.get('/carpoolingMembers', this.getCarpoolingMembers.bind(this));

    router.get('/vehicles', this.getVehicles.bind(this));

    router.get('/lastReservation', this.getLastReservation.bind(this));

    router.get('/typevehicles', this.getTypeVehicles.bind(this));
    
    return router;
    
  }

  private async getReservations(req: Request, res: Response){
    try{
      const reservations = await this.databaseService.getAllReservations();
      res.status(200).json(reservations);
    }catch(e){
      console.log(e);
      res.status(500).send("Fetch error");
    }
  }


  private async createReservation(req: Request, res: Response){
    try{
      this.databaseService.createReservation(req.body);

    } catch(e){
      console.log(e);
      res.status(500).send("Creation error");

    }
  }

  private async searchMember(req: Request, res: Response){
    const name = req.params.nom;
    try{
      const member = await this.databaseService.searchMember(name as string);
      res.status(200).json(member);
    }catch(e){
      console.log(e);
      res.status(500).send("Fetch error");
    }
  }

  private async getLocations(req: Request, res: Response){
    try{
      const locations = await this.databaseService.getAllLocations();
      res.status(200).json(locations);
    }catch(e){
      console.log(e);
      res.status(500).send("Fetch error");
    }
  }

  private async getCoopMembers(req: Request, res: Response){
    try{
      const coopMembers = await this.databaseService.getAllCoopMembers();
      res.status(200).json(coopMembers);
    }catch(e){
      console.log(e);
      res.status(500).send("Fetch error");
    }
  }

  private async getCarpoolingMembers(req: Request, res: Response){
    try{
      const carpoolingMembers = await this.databaseService.getAllCarpoolingMembers();
      res.status(200).json(carpoolingMembers);
    }catch(e){
      console.log(e);
      res.status(500).send("Fetch error");
    }
  }

  private async getVehicles(req: Request, res: Response){
    try{
      const vehicles = await this.databaseService.getAllVehicles();
      res.status(200).json(vehicles);
    }catch(e){
      console.log(e);
      res.status(500).send("Fetch error");
    }
  }
  
  private async getTypeVehicles(req: Request, res: Response){
    try{
      const vehicles = await this.databaseService.getAllTypeVehicule();
      res.status(200).json(vehicles);
    }catch(e){
      console.log(e);
      res.status(500).send("Fetch error");
    }
  }
  private async getLastReservation(req: Request, res: Response){
    try{
        const lastReservation = await this.databaseService.getLastReservation();
        res.status(200).json(lastReservation);
    }catch(e){
        console.log(e);
        res.status(500).send("Fetch error");
    }
  }


}
