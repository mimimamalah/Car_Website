// À DÉCOMMENTER ET À UTILISER LORSQUE VOTRE COMMUNICATION EST IMPLÉMENTÉE
// import { HttpClient } from "@angular/common/http";
import { HttpClient} from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable, Subject, catchError, of,} from "rxjs";
import { Reservation } from "../interfaces/reservation";
import { Member } from "../interfaces/member";
import { Location } from "../interfaces/location";
import { Vehicle } from "../interfaces/vehicle";

@Injectable()
export class CommunicationService {
  // À DÉCOMMENTER ET À UTILISER LORSQUE VOTRE COMMUNICATION EST IMPLÉMENTÉE
  private readonly BASE_URL: string = "http://localhost:3000/database";
  public constructor(private readonly http: HttpClient) {}

  private _listeners: any = new Subject<any>();

  getReservation(): Observable<Reservation[]> {
    return this.http.get<Reservation[]>(`${this.BASE_URL}/reservations`)
    .pipe(catchError(this.handleError<Reservation[]>('/reservations', [])));
  }

  getMember(nom: string): Observable<Member[]> {
    return this.http.get<Member[]>(`${this.BASE_URL}/search/${nom}`)
    .pipe(catchError(this.handleError<Member[]>('/search/:nom')));
  }

  addReservation(reservation: Reservation) {
    return this.http.post<Reservation>(`${this.BASE_URL}/reservation`, reservation)
      .pipe(catchError(this.handleError<Reservation>('/reservation')));
  }

  getLocations(): Observable<Location[]> {
    return this.http.get<Location[]>(`${this.BASE_URL}/locations`)
    .pipe(catchError(this.handleError<Location[]>('/locations')));
  }

  getCoopMembers(): Observable<Member[]> {
    return this.http.get<Member[]>(`${this.BASE_URL}/coopMembers`)
    .pipe(catchError(this.handleError<Member[]>('/coopMembers')));
  }

  getCarpoolingMembers(): Observable<Member[]> {
    return this.http.get<Member[]>(`${this.BASE_URL}/carpoolingMembers`)
    .pipe(catchError(this.handleError<Member[]>('/carpoolingMembers')));
  }

  getVehicles(): Observable<Vehicle[]> {
    return this.http.get<Vehicle[]>(`${this.BASE_URL}/vehicles`)
    .pipe(catchError(this.handleError<Vehicle[]>('/vehicles')));
  }

  getLastReservation(): Observable<Reservation[]> {
    return this.http.get<Reservation[]>(`${this.BASE_URL}/lastReservation`)
    .pipe(catchError(this.handleError<Reservation[]>('/lastReservation')));
  }

  listen(): Observable<any> {
    return this._listeners.asObservable();
  }

  filter(filterBy: string): void {
    this._listeners.next(filterBy);
  }

  //À DÉCOMMENTER ET À UTILISER LORSQUE VOTRE COMMUNICATION EST IMPLÉMENTÉE
  private handleError<T>(
    request: string,
    result?: T
  ): (error: Error) => Observable<T> {
    return (error: Error): Observable<T> => {
      return of(result as T);
    };
  }

}
