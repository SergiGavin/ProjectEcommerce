import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PortatilComponent } from './portatil.component';

describe('PortatilComponent', () => {
  let component: PortatilComponent;
  let fixture: ComponentFixture<PortatilComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PortatilComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(PortatilComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
