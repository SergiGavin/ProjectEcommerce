import { Component } from '@angular/core';
import { FormsModule, NgForm } from '@angular/forms';
import { CustomerService } from '../services/customer.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent {
  constructor(private customerService: CustomerService, private router: Router) {}

  onRegister(form: NgForm) {
    if (form.invalid) return;
    if (form.value.password !== form.value.password_repeat) {
      alert('Las contraseñas no coinciden');
      return;
    }
    // Llamamos al servicio para registrar al usuario
    this.customerService.register({
      first_name: form.value.first_name,
      last_name: form.value.last_name,
      email: form.value.email,
      username:form.value.username,
      password: form.value.password,
    }).subscribe({
      next: res => {
        console.log('Usuario registrado ✅', res);
        this.router.navigate(['/login']); // Volvemos al Login
      },
      error: err => console.error('Error al registrar:', err)
    });

  }

}
