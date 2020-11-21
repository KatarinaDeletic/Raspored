import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login-student',
  templateUrl: './login-student.component.html',
  styleUrls: ['./login-student.component.css']
})
export class LoginStudentComponent implements OnInit {
  public error: boolean;
  public errorMsg: string;

  constructor(protected router: Router, protected _auth: AuthService) {
    this.error = false;
    this.errorMsg = '';
  }

  ngOnInit() {
  }

  onSubmit($event) {
    const payload = {
      username: $event.target[0].value,
      password: $event.target[1].value
    };
    this.validateAccType(payload);
  }

  validateAccType(payload) {
    if (payload.username.includes('@elfak.rs')) {
      this._auth.login(payload);
    } else {
      this.errorMsg = 'Pogrešan tip korisnika!';
      this.error = true;
    }
  }
}
