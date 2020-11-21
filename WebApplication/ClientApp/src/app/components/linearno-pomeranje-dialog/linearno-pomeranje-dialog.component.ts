import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, NumberValueAccessor, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { LabVezbaSpecificna } from 'src/app/models/lab-vezba-specificna.model';
import { LabSpecificnaService } from 'src/app/services/lab-specificna.service';


export interface DialogData {
  kapacitet: number;
  trajanje: number;
  slot: number;
  kraj: string;
  labVezbaId: number;
  labVezbaSpecificnaId: number;
  pomeranje: number;
 }

@Component({
  selector: 'app-linearno-pomeranje-dialog',
  templateUrl: './linearno-pomeranje-dialog.component.html',
  styleUrls: ['./linearno-pomeranje-dialog.component.css']
})
export class LinearnoPomeranjeDialogComponent implements OnInit {

  specificne: LabVezbaSpecificna[];

  pomeriZaFormControl = new FormControl('', [
    Validators.required
  ]);

   minIndexFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern(/^\d+$/)
  ]);
  
  constructor(public dialogRef: MatDialogRef<LinearnoPomeranjeDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
        private labVezbaSpecificna: LabSpecificnaService) { }

  ngOnInit() {
    this.labVezbaSpecificna.getLabVezbaSList({ labVezbaId: this.data.labVezbaId }).subscribe(x => this.specificne = x);
  }

  onNoClick() {
    this.dialogRef.close();
  }

  onSubmit() {
    //if (this.data.kraj !== undefined) {
      if(true){
      this.dialogRef.close(this.data);
    } else {
      alert('Proverite tačnost svih polja!');
    }
  }

}
