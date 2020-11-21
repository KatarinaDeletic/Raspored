import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, NumberValueAccessor, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

export interface DialogData {
  redosled: number;
  ucionica: string;
  // brojStudenata: number;
  labVezbaId: number;
  trajanje: number;
  pocetak: string;
  kraj: string;
  kapacitet: number;
  slot: number;
  minindeks: number;
}

@Component({
  selector: 'app-raspodela-dialog',
  templateUrl: './raspodela-dialog.component.html',
  styleUrls: ['./raspodela-dialog.component.css']
})
export class RaspodelaDialogComponent implements OnInit {


  redosledFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern(/^\d+$/)
  ]);

  kapacitetFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern(/^\d+$/)
  ]);

  ucionicaFormControl = new FormControl('', [
    Validators.required
  ]);

  // brojStudenataFormControl = new FormControl('', [
  //   Validators.required,
  //   Validators.pattern(/^\d+$/)
  // ]);

  slotFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern(/^\d+$/)
  ]);

  trajanjeFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern(/^\d+$/)
  ]);

  minIndexFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern(/^\d+$/)
  ]);

  constructor(public dialogRef: MatDialogRef<RaspodelaDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) { }

  ngOnInit() {
  }

  onNoClick() {
    this.dialogRef.close();
  }

  onSubmit() {
    if (this.redosledFormControl.valid && this.kapacitetFormControl.valid && this.ucionicaFormControl.valid
      && this.slotFormControl.valid && this.trajanjeFormControl.valid && this.data.trajanje && this.data.pocetak !== undefined
      && this.data.kraj !== undefined) {
      this.dialogRef.close(this.data);
    } else {
      alert('Proverite tačnost svih polja!');
    }
  }
}
