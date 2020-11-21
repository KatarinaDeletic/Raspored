import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './services/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent implements OnInit {
  title = 'app';

  constructor(public _auth: AuthService, public router: Router) {
    if (_auth.loggedIn) {
      _auth.whoAmI();
    } else {
      router.navigate['/login/student'];
    }
  }

  ngOnInit(): void {

    if (!this._auth.loggedIn) {
      this.router.navigate['/login/student'];
    }
  }
}
