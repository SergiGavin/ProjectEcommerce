import { Component, Input, OnInit, inject} from '@angular/core';
import { Product} from '../model/product.model';
import { AsyncPipe, CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';


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
    this.fetchProductBasedOnRoute();
  }

  //Fetch dependiendo de la ruta.
  fetchProductBasedOnRoute() {
    const rutaActual = this.router.url;
    if (rutaActual === '/') {
      this.fetchProduct();
    } else if (rutaActual === '/nuevos') {
      this.fetchProductNuevos();
    } else if(rutaActual === '/ofertas'){
      this.fetchProductOfertas();
    }
  }

  //Para recibir todos los productos.
  fetchProduct(){
    this.httpClient.get('http://localhost:8080/ecommerce/product')
    .subscribe((product:any)=>{
      console.log(product);
      this.product = product.slice(0,6);
    });
  }
  //Para recibir los productos nuevos
  fetchProductNuevos(){
    this.httpClient.get('http://localhost:8080/ecommerce/product/nuevos')
    .subscribe((product:any)=>{
      console.log(product);
      this.product = product.slice(0,6);
    });
  }
  fetchProductOfertas(){
    this.httpClient.get('http://localhost:8080/ecommerce/product/ofertas')
    .subscribe((product:any)=>{
      console.log(product);
      this.product = product.slice(0,6);
    });
  }


  constructor(private router: Router) {
    this.rutaInicio();
  }

  rutaInicio(){
    const rutaActual = this.router.url;
    this.mostrarBanner = (rutaActual === '/');
  }
  rutaOfertas(): boolean {
    return this.router.url === '/ofertas'
  }
  rutaNuevos(): boolean {
    return this.router.url === '/nuevos'
  }

  mostrarBanner: boolean = false;
  
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
