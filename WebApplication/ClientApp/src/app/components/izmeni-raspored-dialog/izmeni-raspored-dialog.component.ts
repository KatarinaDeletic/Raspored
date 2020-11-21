import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { Observable } from 'rxjs';
import { LabVezba } from 'src/app/models/lab-vezba.model';
import { Student } from 'src/app/models/student.model';
import { LabVezbaService } from 'src/app/services/lab-vezba.service';

export interface IzmeniRasporedDialogData {
  ucionica: string;
  pocetakLaba: string;
  zavrsetakLaba: string;
  id: number;
}

@Component({
  selector: 'app-izmeni-raspored-dialog',
  templateUrl: './izmeni-raspored-dialog.component.html',
  styleUrls: ['./izmeni-raspored-dialog.component.css']
})
export class IzmeniRasporedDialogComponent implements OnInit {

  labVezbe: Observable<LabVezba[]>;

  constructor(public dialogRef: MatDialogRef<IzmeniRasporedDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: IzmeniRasporedDialogData,
    public labService: LabVezbaService) {
    this.labVezbe = this.labService.getLabVezbaList();
  }

  ucionicaFormControl = new FormControl('', [
    Validators.required
  ]);

  ngOnInit() {
  }
  onNoClick() {
    this.dialogRef.close();
  }
}
