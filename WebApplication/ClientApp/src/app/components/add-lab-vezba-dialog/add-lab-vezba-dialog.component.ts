import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { Observable } from 'rxjs';
import { LabVezba } from 'src/app/models/lab-vezba.model';
import { Student } from 'src/app/models/student.model';
import { LabVezbaService } from 'src/app/services/lab-vezba.service';

export interface AddLabVezbaDialogData {
  student: Student;
  labVezba: number;
}

@Component({
  selector: 'app-add-lab-vezba-dialog',
  templateUrl: './add-lab-vezba-dialog.component.html',
  styleUrls: ['./add-lab-vezba-dialog.component.css']
})
export class AddLabVezbaDialogComponent implements OnInit {

  labVezbe: Observable<LabVezba[]>;

  constructor(public dialogRef: MatDialogRef<AddLabVezbaDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: AddLabVezbaDialogData,
    public labService: LabVezbaService) {
    this.labVezbe = this.labService.getLabVezbaList();
  }

  ngOnInit() {
  }
  onNoClick() {
    this.dialogRef.close();
  }
}
