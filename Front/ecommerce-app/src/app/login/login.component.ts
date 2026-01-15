import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { CustomerService } from '../services/customer.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [RouterModule, FormsModule,CommonModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {

  constructor(private customerService: CustomerService, private router: Router) {}

  onLogin(form: any) {
    if (form.invalid) return;

      this.customerService.login({
      username: form.value.username,
      password: form.value.password
      }).subscribe({
      next: res => {
        console.log('Login exitoso', res);

        localStorage.setItem('user', JSON.stringify(res));// Guardamos el nombre en localStorage convirtiendo el "object" a "string".

        this.customerService.setUser(res); // Actualizamos el estado del usuario en el servicio

        this.router.navigate(['/']); // redirigir a página principal
      },
      error: err => {
        console.error('Error en login', err);
        alert('Usuario o contraseña incorrectos');
      }
      });
  }
}
