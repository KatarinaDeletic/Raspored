import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { eAccountType } from '../models/account.model';
import { AuthService } from './auth.service';
import jwt_decode from 'jwt-decode';

@Injectable()
export class ProfesorService implements CanActivate {
  constructor(
    private _router: Router,
    private _auth: AuthService
  ) { }

  canActivate(): boolean {
    if (jwt_decode(localStorage.getItem('token')).ProfesorId !== undefined) {
      return true;
    }

    this._router.navigate(['/']);
    return false;
  }
}
