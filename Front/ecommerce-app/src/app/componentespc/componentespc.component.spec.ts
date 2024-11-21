import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComponentespcComponent } from './componentespc.component';

describe('ComponentespcComponent', () => {
  let component: ComponentespcComponent;
  let fixture: ComponentFixture<ComponentespcComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ComponentespcComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ComponentespcComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
