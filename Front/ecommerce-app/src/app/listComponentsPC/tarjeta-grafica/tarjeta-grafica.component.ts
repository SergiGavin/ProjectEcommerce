import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../model/product.model';

@Component({
  selector: 'app-tarjeta-grafica',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './tarjeta-grafica.component.html',
  styleUrl: './tarjeta-grafica.component.css'
})
export class TarjetaGraficaComponent implements OnInit{
  httpClient = inject(HttpClient);
  tarjetaGrafica: Product[]=[];

  fetchProductTarjetaGrafica(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/tarjeta_grafica')
    .subscribe({
      next: (response) => {
        console.log('Tarjeta graficas recibidas:', response);
        this.tarjetaGrafica = response; //Asigno los datos a tarjetaGrafica
      },
      error: (error) => console.error('Error al obtener las tarjetas gráficas:', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductTarjetaGrafica();
  }
}

