import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { LabVezbaSpecificna } from 'src/app/models/lab-vezba-specificna.model';
import { LabSpecificnaService } from 'src/app/services/lab-specificna.service';

export interface DialogData {
  kapacitet: number;
  noviKapacitet: number;
  trajanje: number;
  slot: number;
  pocetak: string;
  kraj: string;
  labVezbaId: number;
  labVezbaSpecificnaId: number;

}
@Component({
  selector: 'app-manji-kapacitet',
  templateUrl: './manji-kapacitet.component.html',
  styleUrls: ['./manji-kapacitet.component.css']
})
export class ManjiKapacitetComponent implements OnInit {

  kapacitetFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern(/^\d+$/)
  ]);

  slotFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern(/^\d+$/)
  ]);

  trajanjeFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern(/^\d+$/)
  ]);

  specificne: LabVezbaSpecificna[];

  constructor(public dialogRef: MatDialogRef<ManjiKapacitetComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private labVezbaSpecificna: LabSpecificnaService) { }

  ngOnInit() {
    this.labVezbaSpecificna.getLabVezbaSList({ labVezbaId: this.data.labVezbaId }).subscribe(x => this.specificne = x);
  }

  onNoClick() {
    this.dialogRef.close();
  }

  onSubmit() {
    if (this.kapacitetFormControl.valid) {
      this.dialogRef.close(this.data);
    } else {
      alert('Proverite tačnost svih polja!');
    }
  }
}
