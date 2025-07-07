import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../model/product.model';

@Component({
  selector: 'app-placa-base',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './placa-base.component.html',
  styleUrl: './placa-base.component.css'
})
export class PlacaBaseComponent implements OnInit {

  httpClient = inject(HttpClient);
  placaBase: Product[]=[];

  fetchProductPlacaBase(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/placa_base') 
    .subscribe({
      next: (response) => {
        console.log('Placas bases recibidas:', response);
        this.placaBase = response; 
      },
      error: (error) => console.error('Error al obtener las placa base:', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductPlacaBase();
  }
}

