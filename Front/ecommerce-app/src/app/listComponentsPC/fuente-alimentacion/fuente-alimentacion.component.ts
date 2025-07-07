import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../model/product.model';

@Component({
  selector: 'app-fuente-alimentacion',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './fuente-alimentacion.component.html',
  styleUrl: './fuente-alimentacion.component.css'
})
export class FuenteAlimentacionComponent {
  httpClient = inject(HttpClient);
  fuenteA: Product[]=[];

  fetchProductfuenteA(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/fuente') 
    .subscribe({
      next: (response) => {
        console.log('Fuente de alimentación recibidas:', response);
        this.fuenteA = response; 
      },
      error: (error) => console.error('Error al obtener las fuentes de alimentación: ', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductfuenteA();
  }
}

