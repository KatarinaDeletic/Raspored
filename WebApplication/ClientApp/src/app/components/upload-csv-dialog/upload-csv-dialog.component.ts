import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { NgxCsvParser } from 'ngx-csv-parser';
import { FileInput, FileInputComponent } from 'ngx-material-file-input';

export interface UploadCsvDialogData {
  apiHeaders: string[],
  results?: any[]
}

@Component({
  selector: 'app-upload-csv-dialog',
  templateUrl: './upload-csv-dialog.component.html',
  styleUrls: ['./upload-csv-dialog.component.css']
})
export class UploadCsvDialogComponent implements OnInit {
  fileControl: FormControl;
  headers: { csvHeader: string, apiHeader?: string }[] = [];

  public file;
  @ViewChild(FileInputComponent, { static: true }) fileImportInput: FileInputComponent;

  constructor(public dialogRef: MatDialogRef<UploadCsvDialogComponent>,
    private ngxCsvParser: NgxCsvParser,
    @Inject(MAT_DIALOG_DATA) public data: UploadCsvDialogData) {

    this.fileControl = new FormControl(this.file, [Validators.required]);
  }

  ngOnInit() {
    this.fileControl.valueChanges.subscribe((files: FileInput) => {
      if (files) {
        this.ngxCsvParser.parse(files.files[0], { header: true, delimiter: "," }).subscribe((result: Array<any>) => {
          if (result.length > 0) {
            this.headers = Object.keys(result[0]).map(x => {
              return {
                csvHeader: x
              };
            });
            this.data.results = result;
          }
        })
      }
    })
  }

  abort() {
    this.dialogRef.close();
  }

  finish() {
    const mapping = this.headers.reduce((acc, x) => {
      acc[x.csvHeader] = x.apiHeader
      return acc;
    }, {}) as any;

    this.data.results = this.data.results.map(x => {
      const obj = {};
      for (const item in x) {
        if (mapping[item]) {
          obj[mapping[item]] = x[item];
        }
      }

      return obj;
    });
    this.dialogRef.close(this.data);
  }
}
