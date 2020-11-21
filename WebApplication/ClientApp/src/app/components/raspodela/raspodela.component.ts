import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, ThemePalette } from '@angular/material';
import * as moment from 'moment';
import { LabVezbaSpecificna } from 'src/app/models/lab-vezba-specificna.model';
import { LabVezba } from 'src/app/models/lab-vezba.model';
import { Student } from 'src/app/models/student.model';
import { LabSpecificnaService } from 'src/app/services/lab-specificna.service';
import { LabVezbaService } from 'src/app/services/lab-vezba.service';
import { RasporedService } from 'src/app/services/raspored.service';
import { StudentService as StudentService } from 'src/app/services/studs.service';
import { RaspodelaDialogComponent } from '../raspodela-dialog/raspodela-dialog.component';
import { StudentComponent } from '../student/student.component';
import { StatistikaDialogComponent } from 'src/app/components/statistika-dialog/statistika-dialog.component';
import { ManjiKapacitetComponent } from 'src/app/components/manji-kapacitet/manji-kapacitet.component';
@Component({
  selector: 'app-raspodela',
  templateUrl: './raspodela.component.html',
  styleUrls: ['./raspodela.component.css']
})
export class RaspodelaComponent implements OnInit {

  labVezbe: LabVezba[] = [];
  labSpecificne: LabVezbaSpecificna[] = [];
  studenti: Student[] = [];

  redosled: number;
  ucionica: string;
  brojStudenata: number;
  labVezbaId: number;
  pocetak: string;
  kraj: string;
  kapacitet: number;
  slot: number;
  stat: string;

  tag: string;
  naziv: string;

  public date: moment.Moment;
  public disabled = false;
  public showSpinners = true;
  public showSeconds = false;
  public touchUi = false;
  public minDate: moment.Moment;
  public maxDate: moment.Moment;
  public stepHour = 1;
  public stepMinute = 1;
  public stepSecond = 1;
  public color: ThemePalette = 'primary';
  public enableMeridian = false;

  @ViewChild('dataTable', null) dataTable: StudentComponent;

  constructor(private rasporedService: RasporedService,
    private studentService: StudentService,
    private labVezbaService: LabVezbaService,
    private labVezbaSpecificnaService: LabSpecificnaService,
    public dialog: MatDialog) { }

  ngOnInit() {
    this.labVezbaService.getLabVezbaList({ active: true }).subscribe(x => {
      this.labVezbe = x;
      this.labVezbaId = x[0].id;
      this.test(x[0].id);
    });
  }
  test(value: number) {
    this.studentService.getStudList({ labVezbaId: value }).subscribe(x => {
      this.studenti = x;
      this.dataTable.populate(this.studenti);
    });
    this.labVezbaSpecificnaService.getLabVezbaSList({ labVezbaId: value }).subscribe(x => {
      console.log(x)

      this.labSpecificne = x
    });
  }

  openDialog(): void {
    const dialogRef = this.dialog.open(RaspodelaDialogComponent, {
      width: '350px',
      data: {
        redosled: this.redosled,
        ucionica: this.ucionica,
        brojStudenata: this.brojStudenata,
        labVezbaId: this.labVezbaId,
        pocetak: this.pocetak,
        kraj: this.kraj,
        kapacitet: this.kapacitet,
        slot: this.slot
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result !== undefined) {
        const payload = {
          ...result,
          pocetak: moment(result.pocetak, 'DD/MM/YYYY HH:mm').format('YYYY-MM-DDTHH:mm') + ':00Z',
          kraj: moment(result.kraj, 'DD/MM/YYYY HH:mm').format('YYYY-MM-DDTHH:mm') + ':00Z'
        };
        this.rasporedService.raspodeli(payload).subscribe(x => {
        });
      }
    });
  }

  openDialogStatistika(): void {
    const dialogRef = this.dialog.open(StatistikaDialogComponent, {
      width: '350px',
      data: {
        tag: this.tag,
        naziv: this.naziv,
        redosled: this.redosled,
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result !== undefined) {
        const payload = {
          ...result,
          labVezbaId: this.labVezbaId,
        };

        this.rasporedService.uporedi(payload).subscribe(x => {
          this.stat = x;
        });
      }
    });
  }

  openDialogManjiKapacitet(): void {
    const dialogRef = this.dialog.open(ManjiKapacitetComponent, {
      width: '350px',
      data: {
        redosled: this.redosled,
        kraj: this.kraj,
        kapacitet: this.kapacitet,
        slot: this.slot,
        labVezbaId: this.labVezbaId
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result !== undefined) {
        const payload = {
          ...result,
          labVezbaId: this.labVezbaId,
          kraj: moment(result.kraj, 'DD/MM/YYYY HH:mm').format('YYYY-MM-DDTHH:mm') + ':00Z',
        };

        this.rasporedService.smanjenKapacitet(payload).subscribe(x => {
          // this.stat = x;
        });
      }
    });
  }
}
