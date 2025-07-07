
import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../app/model/product.model';

@Component({
  selector: 'app-portatil',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './portatil.component.html',
  styleUrl: './portatil.component.css'
})
export class PortatilComponent {
  httpClient = inject(HttpClient);
  portatil: Product[]=[];

  fetchProductPortatil(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/portatil') 
    .subscribe({
      next: (response) => {
        console.log('Portatiles recibidos:', response);
        this.portatil = response; 
      },
      error: (error) => console.error('Error al obtener los portatiles: ', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductPortatil();
  }
}
