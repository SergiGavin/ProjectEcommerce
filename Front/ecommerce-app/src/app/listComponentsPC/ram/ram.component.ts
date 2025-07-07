import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../model/product.model';
@Component({
  selector: 'app-ram',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './ram.component.html',
  styleUrl: './ram.component.css'
})
export class RamComponent {
  httpClient = inject(HttpClient);
  RAM: Product[]=[];

  fetchProductRAM(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/ram') 
    .subscribe({
      next: (response) => {
        console.log('RAM recibidas:', response);
        this.RAM = response; 
      },
      error: (error) => console.error('Error al obtener las RAM:', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductRAM();
  }
}
