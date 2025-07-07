import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../app/model/product.model';

@Component({
  selector: 'app-gaming',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './gaming.component.html',
  styleUrl: './gaming.component.css'
})
export class GamingComponent {
httpClient = inject(HttpClient);
gaming: Product[]=[];

  fetchProductGaming(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/gaming') 
    .subscribe({
      next: (response) => {
        console.log('Productos de gaming recibidos:', response);
        this.gaming = response; 
      },
      error: (error) => console.error('Error al obtener los productos de gaming: ', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductGaming();
  }
}
