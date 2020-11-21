import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { LabVezbaSpecificna } from '../models/lab-vezba-specificna.model';

@Injectable({
  providedIn: 'root'
})
export class LabSpecificnaService {

  constructor(private http: HttpClient) { }

  getLabVezbaSList(val?: any) {
    return this.http.get<LabVezbaSpecificna[]>(`/api/LabSpecificna`, { params: val });
  }
  getLabVezbaS(val: any) {
    return this.http.get<LabVezbaSpecificna>(`/api/LabSpecificna`, val);
  }
  addLabVezbaS(val: LabVezbaSpecificna) {
    return this.http.post(`/api/LabSpecificna`, val);
  }
  updateLabVezbaS(val: LabVezbaSpecificna) {
    return this.http.put(`/api/LabSpecificna`, val);
  }
}
