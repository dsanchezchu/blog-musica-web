import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RegisterUserService {
  private apiUrl = 'http://192.168.0.2:8000';
  constructor(private http: HttpClient) { }

  register(user: any): Observable<any>{
    return this.http.post(`${this.apiUrl}/register`, user);
  }
}
