import { Component, Input, OnInit, inject} from '@angular/core';
import { ProductService } from '../services/product.service';
import { Observable } from 'rxjs';
import { Product} from '../model/product.model';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';
import { ProductItemComponent } from '../product-item/product-item.component';


@Component({
  selector: 'app-product',
  standalone: true,
  imports: [AsyncPipe, CommonModule, HttpClientModule, RouterModule],
  templateUrl: './product.component.html',
  styleUrl: './product.component.css'
})
export class ProductComponent implements OnInit {

  httpClient = inject(HttpClient);
  product: Product[]=[];

  ngOnInit(): void {
      this.fetchProduct()
  }

  //Para recibir todos los productos.
  fetchProduct(){
    this.httpClient.get('http://localhost:8080/ecommerce/product')
    .subscribe((product:any)=>{
      console.log(product);
      this.product = product.slice(0,6);

    });
  }
  
  currentBannerIndex: number = 0;
  bannerImages: string[] = [
    '../assets/banner1.png',
    '../assets/banner2.png',
    '../assets/banner3.png'
  ];
    changeBanner(direction: string): void {
      console.log('Cambiando banner', direction)
      console.log('Índice actual:', this.currentBannerIndex);
      if (direction === 'anterior') {
        //Se suma el total de la longitud del banner para que no llegue a ser negativo y con el % nos aseguramos que este dentro de los limites del array.
        this.currentBannerIndex = (this.currentBannerIndex - 1 + this.bannerImages.length) % this.bannerImages.length;
      } else if (direction === 'siguiente') {
        this.currentBannerIndex = (this.currentBannerIndex + 1) % this.bannerImages.length;
      }
    }
}
