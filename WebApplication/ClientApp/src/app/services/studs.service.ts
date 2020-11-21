import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Student } from '../models/student.model';

@Injectable({
  providedIn: 'root'
})
export class StudentService {
  constructor(private http: HttpClient) { }

  getStudList(search?: any) {
    return this.http.get<Student[]>(`/api/Student`, { params: search });
  }
  getStudent(val: any) {
    return this.http.get<Student>(`/api/Student/${val}`);
  }
  addStudent(val: Student) {
    return this.http.post(`/api/Student`, val);
  }
  updateStudent(val: Student) {
    return this.http.put(`/api/Student`, val);
  }
  createStudent(val: Student) {
    return this.http.post(`/api/Student`, val);
  }
  updateNotification(val: { id: number, notification: boolean }) {
    const form = new FormData();
    form.append("id", val.id.toString());
    form.append("notification", val.notification.toString());

    return this.http.put(`/api/Student/notification`, form);
  }

  createStudentMultiple(val) {
    return this.http.post(`/api/Student/multiple`, val);
  }
}
