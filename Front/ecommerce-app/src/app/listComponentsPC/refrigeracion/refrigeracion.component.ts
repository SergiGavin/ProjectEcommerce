import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../model/product.model';

@Component({
  selector: 'app-refrigeracion',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './refrigeracion.component.html',
  styleUrl: './refrigeracion.component.css'
})
export class RefrigeracionComponent {
  httpClient = inject(HttpClient);
  refrigeracion: Product[]=[];

  fetchProductRefri(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/refrigeracion') 
    .subscribe({
      next: (response) => {
        console.log('Refrigeracion recibidas:', response);
        this.refrigeracion = response; 
      },
      error: (error) => console.error('Error al obtener las refrigeraciones:', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductRefri();
  }
}
