import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../model/product.model';

@Component({
  selector: 'app-ventiladores-suple',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './ventiladores-suple.component.html',
  styleUrl: './ventiladores-suple.component.css'
})
export class VentiladoresSupleComponent {
  httpClient = inject(HttpClient);
  ventiladorS: Product[]=[];

  fetchProductVentiladorS(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/ventilador_suple') 
    .subscribe({
      next: (response) => {
        console.log('Ventilador Suplementarios recibidos:', response);
        this.ventiladorS = response; 
      },
      error: (error) => console.error('Error al obtener los ventiladores suplementarios:', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductVentiladorS();
  }
}