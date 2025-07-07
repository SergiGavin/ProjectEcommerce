import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../model/product.model';

@Component({
  selector: 'app-ventiladores-cpu',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './ventiladores-cpu.component.html',
  styleUrl: './ventiladores-cpu.component.css'
})
export class VentiladoresCpuComponent {

  httpClient = inject(HttpClient);
  ventiladorCPU: Product[]=[];

  fetchProductVentiladorCPU(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/ventilador_cpu') 
    .subscribe({
      next: (response) => {
        console.log('Ventilador CPU recibidos:', response);
        this.ventiladorCPU = response; 
      },
      error: (error) => console.error('Error al obtener los ventiladores CPU:', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductVentiladorCPU();
  }
}
