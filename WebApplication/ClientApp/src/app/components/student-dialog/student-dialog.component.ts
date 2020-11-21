import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { Student } from 'src/app/models/student.model';

export interface StudentDialogData extends Student {
  isCreation: boolean;
}

@Component({
  selector: 'app-student-dialog',
  templateUrl: './student-dialog.component.html',
  styleUrls: ['./student-dialog.component.css']
})
export class StudentDialogComponent implements OnInit {

  constructor(public dialogRef: MatDialogRef<StudentDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: StudentDialogData) {
  }

  imeFormControl = new FormControl('', [
    Validators.required
  ]);

  prezimeFormControl = new FormControl('', [
    Validators.required
  ]);

  indeksFormControl = new FormControl('', [
    Validators.required
  ]);

  usernameFormControl = new FormControl('', [
    Validators.required
  ]);

  passwordFormControl = new FormControl('', [
    this.data.isCreation ? Validators.required : Validators.nullValidator
  ]);

  ngOnInit() {
  }

  onNoClick() {
    this.dialogRef.close();
  }

  onSubmit() {
    if (this.imeFormControl.valid && this.prezimeFormControl.valid && this.indeksFormControl.valid
      && this.usernameFormControl.valid && this.passwordFormControl.valid) {
      this.dialogRef.close(this.data);
    } else {
      alert('Proverite tačnost svih polja!');
    }
  }
}
