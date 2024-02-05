import { Component, Input } from '@angular/core';
import { Vehicle } from 'src/app/interfaces/vehicle';

@Component({
  selector: 'app-vehicle-card',
  templateUrl: './vehicle-card.component.html',
  styleUrls: ['./vehicle-card.component.css']
})
export class VehicleCardComponent {
  @Input() vehicle: Vehicle;

}