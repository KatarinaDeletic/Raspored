import { AfterViewInit, Component, OnInit, ViewChild, Input } from '@angular/core';
import { MatDialog, MatPaginator, MatSort, MatTable } from '@angular/material';
import { DataTableDataSource, DataTableItem } from './student-datasource';
import { ActivatedRoute } from '@angular/router';
import { StudentService } from 'src/app/services/studs.service';
import { Student } from 'src/app/models/student.model';
import { StudentDialogComponent, StudentDialogData } from '../student-dialog/student-dialog.component';
import { AddLabVezbaDialogComponent, AddLabVezbaDialogData } from '../add-lab-vezba-dialog/add-lab-vezba-dialog.component';
import { LabVezbaService } from 'src/app/services/lab-vezba.service';
import { UploadCsvDialogComponent, UploadCsvDialogData } from '../upload-csv-dialog/upload-csv-dialog.component';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {
  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;
  @ViewChild(MatSort, { static: false }) sort: MatSort;
  @ViewChild(MatTable, { static: false }) table: MatTable<DataTableItem>;
  dataSource: DataTableDataSource;

  @Input()
  public isRaspodela: boolean;

  constructor(private service: StudentService, private route: ActivatedRoute, public dialog: MatDialog, private labService: LabVezbaService) { }

  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */
  displayedColumns = ['ime', 'prezime', 'indeks', 'email', 'actions'];

  ngOnInit() {
    if (!this.isRaspodela) {
      this.service.getStudList().subscribe(data => {
        this.populate(data);
      });
    }
  }

  populate(data: Student[]) {
    this.dataSource = new DataTableDataSource(data);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
    this.table.dataSource = this.dataSource;
  }

  openDialog(payload): void {
    let data;
    if (Object.keys(payload).length === 0 && payload.constructor === Object) {
      data = {...payload, isCreation: true};
    } else {
      data = {...payload, isCreation: false};
    }
    const dialogRef = this.dialog.open(StudentDialogComponent, {
      width: '350px',
      data
    });

    dialogRef.afterClosed().subscribe((result: StudentDialogData) => {
      if (result !== undefined) {
        if (result.id) {
          this.service.updateStudent(result).subscribe(x => { });
        } else {
          this.service.createStudent(result).subscribe(x => { });
        }
      }
    });
  }

  openDialog2(data): void {
    const dialogRef = this.dialog.open(AddLabVezbaDialogComponent, {
      width: '350px',
      data: { student: data }
    });

    dialogRef.afterClosed().subscribe((result: AddLabVezbaDialogData) => {
      if (result !== undefined) {
        console.log(result);
        this.labService.addStudent({ labId: result.labVezba, studentId: result.student.id }).subscribe(x => { }, err => { });
      }
    });
  }

  openBulkDialog() {
    const apiHeaders = ['ime', 'prezime', 'indeks', 'username'];
    const data: UploadCsvDialogData = {
      apiHeaders
    };
    const dialogRef = this.dialog.open(UploadCsvDialogComponent, {
      width: '450px',
      data
    });

    dialogRef.afterClosed().subscribe((result: UploadCsvDialogData) => {
      if (result !== undefined) {
        this.service.createStudentMultiple(result.results).subscribe(x => { });
      }
    });
  }
}
