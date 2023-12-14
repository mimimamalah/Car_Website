import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Reservation } from 'src/app/interfaces/reservation';
import { CommunicationService } from 'src/app/services/communication.service';


@Component({
  selector: 'app-reservation-creation-page',
  templateUrl: './reservation-creation-page.component.html',
  styleUrls: ['./reservation-creation-page.component.css']
})
export class ReservationCreationPageComponent {
  reservation: Reservation;
  reservationForm: NgForm;

  constructor(private communicationService: CommunicationService) { }

  ngOnInit(): void {
    this.reservationForm = new NgForm([], []);

  }

  createReservation() {
    this.reservation =  {
      reservationid: this.reservationForm.value.reservationid,
      reservationstart: this.reservationForm.value.reservationstart,
      reservationend: this.reservationForm.value.reservationend,
      exigencessup: this.reservationForm.value.exigencessup,
      vehiculeid: this.reservationForm.value.vehiculeid,
      mid: this.reservationForm.value.mid
    };
    console.log(this.reservation);
    this.communicationService.addReservation(this.reservation);
  }
}
