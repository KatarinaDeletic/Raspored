import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Injectable } from '@angular/core';
import { LabVezba } from '../models/lab-vezba.model';
import * as moment from 'moment';


@Injectable({
  providedIn: 'root'
})
export class LabVezbaService {

  constructor(private http: HttpClient) { }

  getLabVezbaList(search?: any) {
    return this.http.get<LabVezba[]>(`/api/LabVezba`, { params: search });
  }
  getLabVezba(val?: any) {
    return this.http.get<LabVezba>(`/api/LabVezba`, val);
  }
  addLabVezba(val: LabVezba) {
    return this.http.post(`/api/LabVezba`, val);
  }
  updateLabVezba(val: LabVezba) {
    return this.http.put(`/api/LabVezba`, val);
  }

  addStudent(val: { labId: number, studentId: number }) {
    return this.http.post(`/api/LabVezba/dodaj-studenta`, val);
  }

  private objectToUrlParams(obj) {
    const urlParams = {};
    for (const x in obj) {
      if (!isNullOrUndefined(obj[x])) {
        if (obj[x] instanceof Date) {
          urlParams[x.charAt(0).toUpperCase() + x.slice(1)] = obj[x].toISOString();
        } else {
          if (moment.isMoment(obj[x])) {
            urlParams[x.charAt(0).toUpperCase() + x.slice(1)] = new Date(obj[x]).toISOString();
          } else {
            urlParams[x.charAt(0).toUpperCase() + x.slice(1)] = obj[x];
          }
        }
      }
    }

    return urlParams;
  }

}

function isNullOrUndefined(value) {
  return value == null || value == undefined;
}
