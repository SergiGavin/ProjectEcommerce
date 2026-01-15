import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, BehaviorSubject,tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {

  private apiUrl = 'http://localhost:8080/ecommerce/customer';

  // Este BehaviorSubject mantiene el estado del usuario
  private currentUserSubject = new BehaviorSubject<any>(null);
  currentUser$ = this.currentUserSubject.asObservable();

  constructor(private http: HttpClient) {
    // Cargamos el usuario del localStorage si ya existe
    const storedUser = localStorage.getItem('user');
    if (storedUser) {
      this.currentUserSubject.next(JSON.parse(storedUser));
    }

  }

  register(userData: { first_name: string; last_name: string; email: string; username:string; password: string }): Observable<any> {
    return this.http.post(`${this.apiUrl}/register`, userData);
  }

  login(credentials: { username:string; password: string }): Observable<any> {
    return this.http.post(`${this.apiUrl}/login`, credentials).pipe(
      tap(user => { //tap nos permite ejecutar un efecto secundario sin alterar el flujo de datos
        localStorage.setItem('user', JSON.stringify(user));
        this.setCurrentUser(user); // <-- actualiza el BehaviorSubject
      })
    );
  }

  setUser(user: any) {
    this.currentUserSubject.next(user);
  }

  logout() {
    localStorage.removeItem('user');
    this.currentUserSubject.next(null);
    
  }
  setCurrentUser(user: any) {
    this.currentUserSubject.next(user);
  }

}
