import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StatistikaDialogComponent } from './statistika-dialog.component';

describe('StatistikaDialogComponent', () => {
  let component: StatistikaDialogComponent;
  let fixture: ComponentFixture<StatistikaDialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [StatistikaDialogComponent]
    })
      .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StatistikaDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
