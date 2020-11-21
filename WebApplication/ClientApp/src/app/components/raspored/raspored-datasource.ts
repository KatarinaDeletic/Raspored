import { DataSource } from '@angular/cdk/collections';
import { MatPaginator, MatSort } from '@angular/material';
import { map } from 'rxjs/operators';
import { Observable, of as observableOf, merge } from 'rxjs';
import { Raspored } from 'src/app/models/raspored.model';

export interface DataTableItem {
  ime: string;
  prezime: string;
  indeks: number;
  labVezba: number;
  pocetakLaba: string;
  zavrsetakLaba: string;
  ucionica: string;
  izmenjen: boolean;
  id: number;
  nazivLabVezbe: string;
}

export class DataTableDataSource extends DataSource<DataTableItem> {
  data: DataTableItem[] = [];
  paginator: MatPaginator;
  sort: MatSort;



  constructor(private raspored: Raspored[]) {
    super();
    this.raspored.forEach(lab => {
      const l: DataTableItem = {
        ime: lab.student.ime,
        prezime: lab.student.prezime,
        indeks: lab.student.indeks,
        labVezba: lab.labVezbaSpecificna.redosled,
        pocetakLaba: lab.pocetakLaba,
        zavrsetakLaba: lab.zavrsetakLaba,
        ucionica: lab.ucionica,
        izmenjen: lab.izmenjen,
        id: lab.id,
        nazivLabVezbe: lab.nazivLabVezbe
      };
      this.data.push(l);
    });
  }

  /**
   * Connect this data source to the table. The table will only update when
   * the returned stream emits new items.
   * @returns A stream of the items to be rendered.
   */
  connect(): Observable<DataTableItem[]> {
    // Combine everything that affects the rendered data into one update
    // stream for the data-table to consume.
    const dataMutations = [
      observableOf(this.data),
      this.paginator.page,
      this.sort.sortChange
    ];

    return merge(...dataMutations).pipe(map(() => {
      return this.getPagedData(this.getSortedData([...this.data]));
    }));
  }

  /**
   *  Called when the table is being destroyed. Use this function, to clean up
   * any open connections or free any held resources that were set up during connect.
   */
  disconnect() { }

  /**
   * Paginate the data (client-side). If you're using server-side pagination,
   * this would be replaced by requesting the appropriate data from the server.
   */
  private getPagedData(data: DataTableItem[]) {
    const startIndex = this.paginator.pageIndex * this.paginator.pageSize;
    return data.splice(startIndex, this.paginator.pageSize);
  }

  /**
   * Sort the data (client-side). If you're using server-side sorting,
   * this would be replaced by requesting the appropriate data from the server.
   */
  private getSortedData(data: DataTableItem[]) {
    if (!this.sort.active || this.sort.direction === '') {
      return data;
    }

    return data.sort((a, b) => {
      const isAsc = this.sort.direction === 'asc';
      switch (this.sort.active) {
        case 'ime': return compare(a.ime, b.ime, isAsc);
        case 'prezime': return compare(a.prezime, b.prezime, isAsc);
        case 'indeks': return compare(+a.indeks, +b.indeks, isAsc);
        case 'labVezba': return compare(+a.labVezba, +b.labVezba, isAsc);
        case 'pocetakLaba': return compare(a.pocetakLaba, b.pocetakLaba, isAsc);
        case 'zavrsetakLaba': return compare(a.zavrsetakLaba, b.zavrsetakLaba, isAsc);
        case 'ucionica': return compare(a.ucionica, b.ucionica, isAsc);
        case 'nazivLaba': return compare(a.nazivLabVezbe, b.nazivLabVezbe, isAsc);
        default: return 0;
      }
    });
  }
}

/** Simple sort comparator for example ID/Name columns (for client-side sorting). */
function compare(a, b, isAsc) {
  return (a < b ? -1 : 1) * (isAsc ? 1 : -1);
}
