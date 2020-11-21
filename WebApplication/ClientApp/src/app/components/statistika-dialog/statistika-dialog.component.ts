import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

export interface DialogData {
  tag: string;
  naziv: string;
  redosled: number;
}

@Component({
  selector: 'app-statistika-dialog',
  templateUrl: './statistika-dialog.component.html',
  styleUrls: ['./statistika-dialog.component.css']
})
export class StatistikaDialogComponent implements OnInit {

  redosledFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern(/^\d+$/)
  ]);


  constructor(public dialogRef: MatDialogRef<StatistikaDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) { }

  ngOnInit() {
  }
  onNoClick() {
    this.dialogRef.close();
  }

  onSubmit() {
    if (this.redosledFormControl.valid !== undefined) {
      this.dialogRef.close(this.data);
    } else {
      alert('Proverite tačnost svih polja!');
    }
  }
}
