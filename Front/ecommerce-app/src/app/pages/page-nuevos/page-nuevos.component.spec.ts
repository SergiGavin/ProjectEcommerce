import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PageNuevosComponent } from './page-nuevos.component';

describe('PageNuevosComponent', () => {
  let component: PageNuevosComponent;
  let fixture: ComponentFixture<PageNuevosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PageNuevosComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(PageNuevosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
