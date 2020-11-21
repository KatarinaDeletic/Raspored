import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManjiKapacitetComponent } from './manji-kapacitet.component';

describe('ManjiKapacitetComponent', () => {
  let component: ManjiKapacitetComponent;
  let fixture: ComponentFixture<ManjiKapacitetComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManjiKapacitetComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManjiKapacitetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
