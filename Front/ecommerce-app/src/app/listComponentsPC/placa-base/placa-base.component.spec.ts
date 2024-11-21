import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlacaBaseComponent } from './placa-base.component';

describe('PlacaBaseComponent', () => {
  let component: PlacaBaseComponent;
  let fixture: ComponentFixture<PlacaBaseComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PlacaBaseComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(PlacaBaseComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
