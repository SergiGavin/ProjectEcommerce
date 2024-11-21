import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FuenteAlimentacionComponent } from './fuente-alimentacion.component';

describe('FuenteAlimentacionComponent', () => {
  let component: FuenteAlimentacionComponent;
  let fixture: ComponentFixture<FuenteAlimentacionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FuenteAlimentacionComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(FuenteAlimentacionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
