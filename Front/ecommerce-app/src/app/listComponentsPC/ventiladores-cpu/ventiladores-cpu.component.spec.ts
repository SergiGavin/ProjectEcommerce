import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VentiladoresCpuComponent } from './ventiladores-cpu.component';

describe('VentiladoresCpuComponent', () => {
  let component: VentiladoresCpuComponent;
  let fixture: ComponentFixture<VentiladoresCpuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [VentiladoresCpuComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(VentiladoresCpuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
