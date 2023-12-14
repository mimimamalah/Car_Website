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
import { ReservationCreationPageComponent } from './pages/reservation-creation-page/reservation-creation-page.component';
import { SearchPageComponent } from './pages/search-page/search-page.component';
import { RegistrationPageComponent } from './pages/registration-page/registration-page.component';
import { ReservationCardComponent } from './components/reservation-card/reservation-card.component';
import { MemberDetailsComponent } from './components/member-details/member-details.component';

@NgModule({
  declarations: [
    AppComponent,
    ReservationsPageComponent,
    ReservationCreationPageComponent,
    SearchPageComponent,
    RegistrationPageComponent,
    ReservationCardComponent,
    MemberDetailsComponent
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
