import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TarjetaGraficaComponent } from './tarjeta-grafica.component';

describe('TarjetaGraficaComponent', () => {
  let component: TarjetaGraficaComponent;
  let fixture: ComponentFixture<TarjetaGraficaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TarjetaGraficaComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(TarjetaGraficaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
