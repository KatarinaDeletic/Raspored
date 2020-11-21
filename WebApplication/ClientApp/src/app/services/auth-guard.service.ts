import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';

@Injectable()
export class AuthGuardService implements CanActivate {
  constructor(
    private _router: Router
  ) { }

  canActivate(): boolean {
    const token = localStorage.getItem('token');
    if (token) {
      return true;
    }

    this._router.navigate(['login/student']);
    return false;
  }
}
