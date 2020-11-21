import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Student } from 'src/app/models/student.model';
import { StudentService } from 'src/app/services/studs.service';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-nav-menu',
  templateUrl: './nav-menu.component.html',
  styleUrls: ['./nav-menu.component.css']
})
export class NavMenuComponent implements OnInit {
  isExpanded = false;
  student: Student;

  public type: boolean;
  isHandset$: Observable<boolean> = this.breakpointObserver.observe(Breakpoints.Handset)
    .pipe(
      map(result => result.matches)
    );

  constructor(private breakpointObserver: BreakpointObserver, public _auth: AuthService, private _router: Router, private studentService: StudentService) {
    this._auth.loaded.subscribe(x => {
      if (this._auth.isStudent) {
        console.log(this._auth.currentUser);
        this.studentService.getStudent(this._auth.currentUser.id).subscribe(x => this.student = x);
      }
    })
  }

  ngOnInit(): void {

  }

  collapse() {
    this.isExpanded = false;
  }

  toggle() {
    this.isExpanded = !this.isExpanded;
  }

  notificationChange(ev) {
    this.studentService.updateNotification({
      id: this.student.id,
      notification: ev
    }).subscribe(x => {
      this.student.notifikacije = ev;
    })
  }
}
