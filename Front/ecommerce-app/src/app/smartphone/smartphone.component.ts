import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../app/model/product.model';

@Component({
  selector: 'app-smartphone',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './smartphone.component.html',
  styleUrl: './smartphone.component.css'
})
export class SmartphoneComponent {
  httpClient = inject(HttpClient);
  smartphone: Product[]=[];

  fetchProductSmartphone(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/smartphone') 
    .subscribe({
      next: (response) => {
        console.log('Smartphone recibidos:', response);
        this.smartphone = response; 
      },
      error: (error) => console.error('Error al obtener los smartphone: ', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductSmartphone();
  }
}
