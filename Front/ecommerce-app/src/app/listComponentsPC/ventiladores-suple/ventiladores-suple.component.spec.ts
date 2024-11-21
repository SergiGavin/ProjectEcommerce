import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VentiladoresSupleComponent } from './ventiladores-suple.component';

describe('VentiladoresSupleComponent', () => {
  let component: VentiladoresSupleComponent;
  let fixture: ComponentFixture<VentiladoresSupleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [VentiladoresSupleComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(VentiladoresSupleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
