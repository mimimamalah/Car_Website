import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

import { AppComponent } from "../app.component";
import { ReservationsPageComponent } from "../pages/reservations-page/reservations-page.component";
import { SearchPageComponent } from "../pages/search-page/search-page.component";
import { RegistrationPageComponent } from "../pages/registration-page/registration-page.component";
import { CarsPageComponent } from "../pages/cars-page/cars-page.component";
import { MemberPageComponent } from "../pages/member-page/member-page.component";

const routes: Routes = [
  { path: "app", component: AppComponent },
  { path: "reservations", component: ReservationsPageComponent },
  { path: "search", component: SearchPageComponent},
  { path: "registration", component: RegistrationPageComponent},
  { path: "cars", component: CarsPageComponent},
  { path: "member", component: MemberPageComponent }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }
