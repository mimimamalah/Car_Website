import { Component, OnInit } from '@angular/core';
import { Vehicle } from 'src/app/interfaces/vehicle';
import { CommunicationService } from 'src/app/services/communication.service';

@Component({
  selector: 'app-cars-page',
  templateUrl: './cars-page.component.html',
  styleUrls: ['./cars-page.component.css']
})
export class CarsPageComponent implements OnInit{
  vehicles: Vehicle[] = [];

  constructor(private communicationService: CommunicationService){}

  ngOnInit(): void {
    this.communicationService.getVehicles().subscribe((response) => {
        if (response){
          this.vehicles = response;
        }
    });
  
  }}