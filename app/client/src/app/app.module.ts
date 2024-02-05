import { CommonModule } from "@angular/common";
import { HttpClientModule } from "@angular/common/http";
import { NgModule } from "@angular/core";
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from "@angular/platform-browser";
import { AppRoutingModule } from "./modules/app-routing.module";
import { AppComponent } from "./app.component";
import { CommunicationService } from "./services/communication.service";
import { AppMaterialModule } from './modules/material.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ReservationsPageComponent } from './pages/reservations-page/reservations-page.component';
import { SearchPageComponent } from './pages/search-page/search-page.component';
import { RegistrationPageComponent } from './pages/registration-page/registration-page.component';
import { ReservationCardComponent } from './components/reservation-card/reservation-card.component';
import { MemberDetailsComponent } from './components/member-details/member-details.component';
import { VehicleCardComponent } from "./components/vehicle-card/vehicle-card.component";
import { CarsPageComponent } from "./pages/cars-page/cars-page.component";
import { MemberPageComponent } from "./pages/member-page/member-page.component";

@NgModule({
  declarations: [
    AppComponent,
    ReservationsPageComponent,
    SearchPageComponent,
    RegistrationPageComponent,
    ReservationCardComponent,
    MemberDetailsComponent,
    VehicleCardComponent,
    CarsPageComponent,
    MemberPageComponent
  ],
  imports: [
    CommonModule,
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    AppMaterialModule
  ],
  providers: [CommunicationService],
  entryComponents: [],
  bootstrap: [AppComponent],
})
export class AppModule { }
