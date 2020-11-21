import { DataSource } from '@angular/cdk/collections';
import { MatPaginator, MatSort } from '@angular/material';
import { map } from 'rxjs/operators';
import { Observable, of as observableOf, merge } from 'rxjs';
import { Student } from 'src/app/models/student.model';

export interface DataTableItem {
  id: number;
  ime: string;
  prezime: string;
  indeks: number;
  username: string;
  notifikacije: boolean;
}

export class DataTableDataSource extends DataSource<DataTableItem> {
  data: DataTableItem[] = [];
  paginator: MatPaginator;
  sort: MatSort;



  constructor(private student: Student[]) {
    super();
    this.student.forEach(stud => {
      const s: DataTableItem = {
        id: stud.id,
        ime: stud.ime,
        prezime: stud.prezime,
        indeks: stud.indeks,
        username: stud.username,
        notifikacije: stud.notifikacije
      };
      this.data.push(s);
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
        case 'email': return compare(a.username, b.username, isAsc);
        default: return 0;
      }
    });
  }
}

/** Simple sort comparator for example ID/Name columns (for client-side sorting). */
function compare(a, b, isAsc) {
  return (a < b ? -1 : 1) * (isAsc ? 1 : -1);
}
