import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../model/product.model';

@Component({
  selector: 'app-tarjeta-sonido',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './tarjeta-sonido.component.html',
  styleUrl: './tarjeta-sonido.component.css'
})
export class TarjetaSonidoComponent {

  httpClient = inject(HttpClient);
  tarjetaSonido: Product[]=[];

  fetchProductTarjetaSonido(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/tarjeta_sonido') 
    .subscribe({
      next: (response) => {
        console.log('Tarjetas de sonido recibidas:', response);
        this.tarjetaSonido = response; 
      },
      error: (error) => console.error('Error al obtener las tarjetas de sonido:', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductTarjetaSonido();
  }
}
