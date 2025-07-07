import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../app/model/product.model';

@Component({
  selector: 'app-tv',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './tv.component.html',
  styleUrl: './tv.component.css'
})
export class TVComponent {
httpClient = inject(HttpClient);
televisor: Product[]=[];

  fetchProductTV(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/tv') 
    .subscribe({
      next: (response) => {
        console.log('Televisores recibidos:', response);
        this.televisor = response; 
      },
      error: (error) => console.error('Error al obtener los televisores: ', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductTV();
  }
}
