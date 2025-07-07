import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../model/product.model';

@Component({
  selector: 'app-procesadores',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './procesadores.component.html',
  styleUrl: './procesadores.component.css'
})
export class ProcesadoresComponent {
  httpClient = inject(HttpClient);
  procesadores: Product[]=[];

  fetchProductProcesadores(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/procesador')
    .subscribe({
      next: (response) => {
        console.log('Procesadores recibidos:', response);
        this.procesadores = response; 
      },
      error: (error) => console.error('Error al obtener los procesadores:', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductProcesadores();
  }
}
