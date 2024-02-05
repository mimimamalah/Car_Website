import { Component, OnInit } from '@angular/core';
import { Reservation } from 'src/app/interfaces/reservation';
import { CommunicationService } from 'src/app/services/communication.service';

@Component({
  selector: 'app-reservations-page',
  templateUrl: './reservations-page.component.html',
  styleUrls: ['./reservations-page.component.css']
})
export class ReservationsPageComponent implements OnInit{
  reservations: Reservation[] = [];

  constructor(private communicationService: CommunicationService){}

  ngOnInit(): void {
    this.communicationService.getReservation().subscribe((response) => {
        if (response){
          this.reservations = response;
        }
    });
  }
}