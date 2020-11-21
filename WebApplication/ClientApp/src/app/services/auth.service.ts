import { HttpClient } from '@angular/common/http';
import { EventEmitter, Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Account, eAccountType } from '../models/account.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  currentUser: Account;

  loaded = new EventEmitter();

  get isProfesor(): boolean | null {
    return this.currentUser ? this.currentUser.type === eAccountType.profesor : false;
  }

  get isStudent() {
    return this.currentUser ? this.currentUser.type === eAccountType.student : false;
  }

  get loggedIn() {
    return !!localStorage.getItem('token');
  }

  constructor(private _http: HttpClient, private router: Router) { }

  login(loginObj: { username: string, password: string }) {
    this._http.post<{ token: string, account: Account }>(`api/Account/Login`, loginObj).subscribe(x => {
      localStorage.setItem('token', x.token);
      this.currentUser = x.account;
      this.loaded.emit();
      this.router.navigate(['/']);
    });
  }

  whoAmI() {
    this._http.get<Account>(`api/Account/who-am-i`).subscribe(x => {
      this.currentUser = x;
      this.loaded.emit();
    }, (err) => {
      localStorage.removeItem('token');
    });
  }

  logout() {
    this.currentUser = null;
    localStorage.removeItem('token');
    this.router.navigate(['/login/student']);
  }
}
