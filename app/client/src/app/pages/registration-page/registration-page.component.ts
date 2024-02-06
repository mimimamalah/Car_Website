import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CommunicationService } from 'src/app/services/communication.service';
import { Reservation } from 'src/app/interfaces/reservation';
import { Vehicle } from 'src/app/interfaces/vehicle';

@Component({
  selector: 'app-registration-page',
  templateUrl: './registration-page.component.html',
  styleUrls: ['./registration-page.component.css']
})
export class RegistrationPageComponent {
  
  registrationForm: FormGroup;
  
  placeOptions: string[] = [];
  coopMemberOptions: string[] = [];
  carpoolingMemberOptions: string[] = [];
  allVehicles: Vehicle[] = [];
  vehicleOptions: string[] = [];
  isVehicleOptionsEmpty: boolean = false;

  newReservationId: string;

  allPlaces = 'Tous les emplacements';

  constructor(private formBuilder: FormBuilder, private communicationService: CommunicationService) { }

  ngOnInit(): void {
    this.registrationForm = this.formBuilder.group({
      member: ['', Validators.required],
      place: ['', Validators.required],
      startDate: ['', Validators.required],
      endDate: ['', Validators.required],
      requirements: [null],
      vehicle: ['', Validators.required],
    });
  
    this.communicationService.getLocations().subscribe((response) => {
      if (response) {
        this.placeOptions = response.map((location) => location.nomemplacement);
        this.placeOptions.unshift(this.allPlaces);
        if (this.placeOptions.length > 0) {
          this.registrationForm.patchValue({
            place: this.placeOptions[0]
          });
        }
      }
    });

    this.communicationService.getCoopMembers().subscribe((response) => {
      if (response) {
        this.coopMemberOptions = response.map((member) => member.prenom + ' ' + member.nom + ' (' + member.mid + ')');
        this.registrationForm.patchValue({
          member: this.coopMemberOptions[0]
        });
      }
    });

    this.communicationService.getCarpoolingMembers().subscribe((response) => {
      if (response) {
        this.carpoolingMemberOptions = response.map((member) => member.prenom + ' ' + member.nom + ' (' + member.mid + ')');
      }
    });

    this.communicationService.getVehicles().subscribe((response) => {
      if (response) {
        this.allVehicles = response;
        this.onSelect(this.allPlaces);
        this.registrationForm.patchValue({
          vehicle: this.vehicleOptions[0]
        });
      }
    });

    this.communicationService.getLastReservation().subscribe((response) => {
      if (response) {
        this.newReservationId = this.createNewReservationId(response[0].reservationid);
      }
    });
  }

  onSubmit(): void {
    if (this.isVehicleOptionsEmpty) {
      alert('Aucun véhicule disponible pour cet emplacement');
      return;
    }
    const startDate = this.registrationForm.value.startDate;
    const endDate = this.registrationForm.value.endDate;
    if (!this.isValidDate(startDate, endDate)) {
      alert('La date de début doit être antérieure à la date de fin');
      return;
    }
    if (this.registrationForm.valid) {
      const reservation: Reservation = {
        reservationid: this.newReservationId,
        reservationstart: this.registrationForm.value.startDate,
        reservationend: this.registrationForm.value.endDate,
        exigencessup: this.registrationForm.value.requirements,
        vehiculeid: this.extractEntityId(this.registrationForm.value.vehicle),
        mid: +this.extractEntityId(this.registrationForm.value.member),
      };
      this.communicationService.addReservation(reservation).subscribe((response) => {});
      alert('Réservation créée avec succès');
    }
  }

  isValidDate(startDate: string, endDate: string): boolean {
    const startDateObj = new Date(startDate);
    const endDateObj = new Date(endDate);
    return startDateObj < endDateObj;
  }

  extractEntityId(entity: string): string {
      const entityId = entity.slice(entity.indexOf('(') + 1, entity.indexOf(')'));
      return entityId;
  }

  createNewReservationId(lastReservationId: string): string {
    const lastReservationIdNumber = Number(lastReservationId.slice(3));
    const newReservationIdNumber = lastReservationIdNumber + 1;
    const paddedNewReservationIdNumber = newReservationIdNumber.toString().padStart(4, '0');
    return 'RSV' + paddedNewReservationIdNumber;
  }

  onSelect(selectedPlace: string): void {
    if (selectedPlace === this.allPlaces) {
      this.vehicleOptions = this.allVehicles.map((vehicle) => vehicle.marque + ' ' + vehicle.modele + ' (' + vehicle.plaqueimmatriculation + ')' + 
        ' - ' + vehicle.nomemplacement);
      this.isVehicleOptionsEmpty = false;
    } else {
      this.vehicleOptions = this.allVehicles.filter((vehicle) => vehicle.nomemplacement === selectedPlace).map((vehicle) => vehicle.marque + ' ' + 
        vehicle.modele + ' (' + vehicle.plaqueimmatriculation + ')' + ' - ' + vehicle.nomemplacement);
      this.isVehicleOptionsEmpty = false;
    }
    if (this.vehicleOptions.length === 0) {
      this.vehicleOptions.push('Aucun véhicule disponible');
      this.isVehicleOptionsEmpty = true;
    }
  }
}
