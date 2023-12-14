import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

import { AppComponent } from "../app.component";
import { ReservationsPageComponent } from "../pages/reservations-page/reservations-page.component";
import { ReservationCreationPageComponent } from "../pages/reservation-creation-page/reservation-creation-page.component";
import { SearchPageComponent } from "../pages/search-page/search-page.component";
import { RegistrationPageComponent } from "../pages/registration-page/registration-page.component";

const routes: Routes = [
  { path: "app", component: AppComponent },
  { path: "reservations", component: ReservationsPageComponent },
  { path: "creation", component: ReservationCreationPageComponent},
  { path: "search", component: SearchPageComponent},
  { path: "registration", component: RegistrationPageComponent}
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }
