import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Observable , catchError, of, throwError} from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserDetailsService {

  constructor(private http: HttpClient) { }

  private Endpoint = "http://localhost:5037/api/Login"

  GetUserDetails(credentials: any) : Observable<any>{
    console.log("stuff from service",credentials.email,credentials.passwordHash)
    return this.http.post<any>(this.Endpoint,credentials).pipe(
      catchError(this.handleError)
    );
  }

  private handleError(error: HttpErrorResponse) {
    console.error('An error occurred:', error.error);
    return throwError('Something bad happened; please try again later.');
  }
}
