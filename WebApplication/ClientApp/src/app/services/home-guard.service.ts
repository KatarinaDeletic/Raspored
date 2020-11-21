import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import jwt_decode from 'jwt-decode';
import { AuthService } from './auth.service';

@Injectable()
export class HomeService implements CanActivate {
  constructor(
    private _router: Router,
    private _auth: AuthService
  ) { }

  canActivate(): boolean {
    if (this._auth.isProfesor) {
      this._router.navigate(['raspodela']);
    } else {
      this._router.navigate(['raspored']);
    }
    return true;
  }
}
