import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReservationCreationPageComponent } from './reservation-creation-page.component';

describe('ReservationCreationPageComponent', () => {
  let component: ReservationCreationPageComponent;
  let fixture: ComponentFixture<ReservationCreationPageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReservationCreationPageComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ReservationCreationPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
