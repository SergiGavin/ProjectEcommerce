import { Component, Input, OnInit, inject} from '@angular/core';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';
import { Product } from '../../app/model/product.model';

@Component({
  selector: 'app-monitor',
  standalone: true,
  imports: [CommonModule, HttpClientModule, RouterModule],
  templateUrl: './monitor.component.html',
  styleUrl: './monitor.component.css'
})
export class MonitorComponent {
httpClient = inject(HttpClient);
monitor: Product[]=[];

  fetchProductMonitor(){
    this.httpClient.get<Product[]>('http://localhost:8080/ecommerce/product/category/monitor') 
    .subscribe({
      next: (response) => {
        console.log('Monitores recibidos:', response);
        this.monitor = response; 
      },
      error: (error) => console.error('Error al obtener los monitores: ', error)
    });
  }
  ngOnInit(): void {
    this.fetchProductMonitor();
  }
}
