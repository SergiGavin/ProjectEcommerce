import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../model/product.model';

@Component({
  selector: 'app-ssd',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './ssd.component.html',
  styleUrl: './ssd.component.css'
})
export class SsdComponent {
  httpClient = inject(HttpClient);
  ssd: Product[]=[];

  fetchProductSSD(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/ssd') 
    .subscribe({
      next: (response) => {
        console.log('SSD recibidas:', response);
        this.ssd = response; 
      },
      error: (error) => console.error('Error al obtener los SSD:', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductSSD();
  }
}
