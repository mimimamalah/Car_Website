import { Component, Input } from '@angular/core';
import { Reservation } from 'src/app/interfaces/reservation';

@Component({
  selector: 'app-reservation-card',
  templateUrl: './reservation-card.component.html',
  styleUrls: ['./reservation-card.component.css']
})
export class ReservationCardComponent {
  @Input() reservation: Reservation;

}
