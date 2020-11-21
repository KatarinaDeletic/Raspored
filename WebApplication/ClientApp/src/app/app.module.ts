import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './components/nav-menu/nav-menu.component';
import { HomeComponent } from './components/home/home.component';
import { StudentComponent } from './components/student/student.component';
import { RaspodelaComponent } from './components/raspodela/raspodela.component';
import { InterceptorService } from './services/interceptor.service';
import { AuthGuardService } from './services/auth-guard.service';
import { ProfesorService } from './services/profesor-guard.service';
import { AngularModule } from './angular.module';
import { LoginProfesorComponent } from './components/login-professor/login-professor.component';
import { LoginStudentComponent } from './components/login-student/login-student.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { RasporedComponent } from './components/raspored/raspored.component';
import { NGX_MAT_DATE_FORMATS } from '@angular-material-components/datetime-picker';
import { RaspodelaDialogComponent } from './components/raspodela-dialog/raspodela-dialog.component';
import { StudentDialogComponent } from './components/student-dialog/student-dialog.component';
import { HomeService } from './services/home-guard.service';
import { AddLabVezbaDialogComponent } from './components/add-lab-vezba-dialog/add-lab-vezba-dialog.component';
import { IzmeniRasporedDialogComponent } from './components/izmeni-raspored-dialog/izmeni-raspored-dialog.component';
import { UploadCsvDialogComponent } from './components/upload-csv-dialog/upload-csv-dialog.component';
import { NgxCsvParserModule } from 'ngx-csv-parser';
import { StatistikaDialogComponent } from './components/statistika-dialog/statistika-dialog.component';
import { ManjiKapacitetComponent } from './components/manji-kapacitet/manji-kapacitet.component';





export const FORMAT = {
  parse: {
    dateInput: 'LL',
  },
  display: {
    dateInput: 'DD-MM-YYYY HH:mm',
    monthYearLabel: 'YYYY',
    dateA11yLabel: 'LL',
    monthYearA11yLabel: 'YYYY',
  },
};

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    StudentComponent,
    RaspodelaComponent,
    LoginProfesorComponent,
    LoginStudentComponent,
    RasporedComponent,
    RaspodelaDialogComponent,
    StudentDialogComponent,
    AddLabVezbaDialogComponent,
    IzmeniRasporedDialogComponent,
    UploadCsvDialogComponent,
    StatistikaDialogComponent,
    ManjiKapacitetComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    AngularModule,
    BrowserAnimationsModule,
    RouterModule.forRoot([
      { path: '', component: HomeComponent, pathMatch: 'full', canActivate: [AuthGuardService, HomeService] },
      { path: 'login/student', component: LoginStudentComponent },
      { path: 'login/profesor', component: LoginProfesorComponent },
      { path: 'student', component: StudentComponent, canActivate: [AuthGuardService, ProfesorService] },
      { path: 'raspored', component: RasporedComponent, canActivate: [AuthGuardService] },
      { path: 'raspodela', component: RaspodelaComponent, canActivate: [AuthGuardService, ProfesorService] },
    ]),
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: InterceptorService,
      multi: true
    },
    {
      provide: NGX_MAT_DATE_FORMATS,
      useValue: FORMAT
    },
    AuthGuardService,
    ProfesorService,
    HomeService,
    NgxCsvParserModule
  ],
  entryComponents: [
    RaspodelaDialogComponent,
    StudentDialogComponent, AddLabVezbaDialogComponent,
    IzmeniRasporedDialogComponent,
    UploadCsvDialogComponent,
    StatistikaDialogComponent,
    ManjiKapacitetComponent
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
