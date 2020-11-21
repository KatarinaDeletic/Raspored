import { AfterViewInit, Component, OnInit, ViewChild, Input, ChangeDetectorRef } from '@angular/core';
import { MatDialog, MatPaginator, MatSort, MatTable } from '@angular/material';
import { DataTableDataSource, DataTableItem } from './raspored-datasource';
import { ActivatedRoute } from '@angular/router';
import { RasporedService } from 'src/app/services/raspored.service';
import { AuthService } from 'src/app/services/auth.service';
import { IzmeniRasporedDialogComponent, IzmeniRasporedDialogData } from '../izmeni-raspored-dialog/izmeni-raspored-dialog.component';
import { UploadCsvDialogComponent, UploadCsvDialogData } from '../upload-csv-dialog/upload-csv-dialog.component';
import { LabVezbaService } from 'src/app/services/lab-vezba.service';
import { LabVezba } from 'src/app/models/lab-vezba.model';
import { LabSpecificnaService } from 'src/app/services/lab-specificna.service';
import { LabVezbaSpecificna } from 'src/app/models/lab-vezba-specificna.model';

@Component({
  selector: 'app-raspored',
  templateUrl: './raspored.component.html',
  styleUrls: ['./raspored.component.css']
})
export class RasporedComponent implements OnInit {
  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;
  @ViewChild(MatSort, { static: false }) sort: MatSort;
  @ViewChild(MatTable, { static: false }) table: MatTable<DataTableItem>;
  @ViewChild('labSelect', null) labSelect;
  dataSource: DataTableDataSource;
  labVezbe: LabVezba[] = [];
  labSpecificne: LabVezbaSpecificna[] = [];
  labVezbaId = -1;
  labSpecificnaId = -1;

  constructor(private service: RasporedService, private labVezbaService: LabVezbaService,
    private labVezbaSpecificnaService: LabSpecificnaService, private route: ActivatedRoute,
    public auth: AuthService, public dialog: MatDialog) { }

  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */
  displayedColumns = ['ime', 'prezime', 'indeks', 'nazivLaba', 'labVezba', 'pocetakLaba', 'zavrsetakLaba', 'ucionica', 'actions'];

  ngOnInit() {
    this.service.getRaspored().subscribe(data => {
      this.refresh(data);
    });
    this.labVezbaService.getLabVezbaList({ active: true }).subscribe(x => {
      this.labVezbe = x;
    });
  }

  test(value: number) {
    if (value !== -1) {
      this.service.filterRaspored({ labId: value, specId: -1 }).subscribe(x => this.refresh(x));
      this.labVezbaSpecificnaService.getLabVezbaSList({ labVezbaId: value }).subscribe(
        x => this.labSpecificne = x/*Postoje duplikati, ne znam da li su duplikati slucajni ili namerni => .filter((v, i, a) => a.findIndex(t => (t.redosled === v.redosled)) === i)*/);
    } else {
      this.service.getRaspored().subscribe(data => {
        this.refresh(data);
      });
    }
  }

  filter(value: number) {
    this.service.filterRaspored({ labId: this.labSelect.value, specId: value }).subscribe(x => this.refresh(x));
  }

  openDialog(data) {
    const dialogRef = this.dialog.open(IzmeniRasporedDialogComponent, {
      width: '350px',
      data
    });

    dialogRef.afterClosed().subscribe((result: IzmeniRasporedDialogData) => {
      if (result !== undefined) {
        this.service.updateRaspored({
          id: result.id,
          ucionica: result.ucionica,
          pocetakLaba: result.pocetakLaba,
          zavrsetakLaba: result.zavrsetakLaba
        }).subscribe(x => { });
      }
      // if (result !== undefined) {
      //   const payload: Raspored = {
      //     student
      //   }
      // this.service.updateRaspored(result).subscribe(x => { });
      // }
    });
  }

  openBulkDialog() {
    const apiHeaders = ['ime', 'prezime', 'email', 'indeks', 'nazivLabVezbe', 'tag', 'labVezba', 'pocetak', 'kraj', 'ucionica'];
    const data: UploadCsvDialogData = {
      apiHeaders
    };
    const dialogRef = this.dialog.open(UploadCsvDialogComponent, {
      width: '450px',
      data
    });

    dialogRef.afterClosed().subscribe((result: UploadCsvDialogData) => {
      if (result !== undefined) {
        // TODO: Dodati servis ovde!
        this.service.createMultiple(result.results).subscribe(x => { });
      }
    });
  }

  refresh(data) {
    this.dataSource = new DataTableDataSource(data);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
    this.table.dataSource = this.dataSource;
    // this.table.renderRows();
  }
}
