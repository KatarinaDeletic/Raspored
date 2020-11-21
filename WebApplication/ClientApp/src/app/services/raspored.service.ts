import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Raspored } from '../models/raspored.model';

@Injectable({
  providedIn: 'root'
})
export class RasporedService {

  constructor(private http: HttpClient) { }

  getRaspored() {
    return this.http.get<Raspored[]>(`/api/Raspored`);
  }
  filterRaspored(filter?: any) {
    return this.http.get<Raspored[]>(`/api/Raspored/filter?labId=${filter.labId}&specId=${filter.specId}`);
  }
  addRaspored(val: Raspored) {
    return this.http.post(`/api/Raspored`, val);
  }
  updateRaspored(val: Partial<Raspored>) {
    return this.http.put(`/api/Raspored`, val);
  }

  prosek() {
    return this.http.get(`/api/Raspored/raspored`);
  }

  raspodeli(val: any) {
    return this.http.post('/api/Raspored/raspodeli', val);
  }

  uporedi(val: any) {
    return this.http.post('/api/Raspored/uporedi', val, { responseType: "text" });
  }

  smanjenKapacitet(val: any) {
    return this.http.post('/api/Raspored/smanjenkapacitet', val, { responseType: "text" });
  }

  createMultiple(val) {
    return this.http.post(`/api/Raspored/multiple`, val);
  }
}
