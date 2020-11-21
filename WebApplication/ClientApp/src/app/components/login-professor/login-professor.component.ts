import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import { LoginStudentComponent } from '../login-student/login-student.component';

@Component({
  selector: 'app-login-professor',
  templateUrl: './login-professor.component.html',
  styleUrls: ['./login-professor.component.css']
})
export class LoginProfesorComponent extends LoginStudentComponent implements OnInit {
  constructor(router: Router, _auth: AuthService) {
    super(router, _auth);
    this.error = false;
    this.errorMsg = '';
  }

  ngOnInit() {
    super.ngOnInit();
  }

  onSubmit($event) {
    super.onSubmit($event);
  }

  validateAccType(payload) {
    if (payload.username.includes('@elfak.ni.ac.rs')) {
      this._auth.login(payload);
    } else {
      this.errorMsg = 'Pogrešan tip korisnika!';
      this.error = true;
    }
  }
}
