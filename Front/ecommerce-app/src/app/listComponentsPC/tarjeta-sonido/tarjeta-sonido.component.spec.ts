import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TarjetaSonidoComponent } from './tarjeta-sonido.component';

describe('TarjetaSonidoComponent', () => {
  let component: TarjetaSonidoComponent;
  let fixture: ComponentFixture<TarjetaSonidoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TarjetaSonidoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(TarjetaSonidoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
