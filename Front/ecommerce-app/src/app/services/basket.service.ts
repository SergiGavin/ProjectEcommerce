import { Injectable } from '@angular/core';
import { Product } from '../model/product.model';

@Injectable({
  providedIn: 'root'
})
export class BasketService {

  private basket: Product[] = [];


  constructor() { }


  addToBasket(product: Product) {
    this.basket.push(product);
  }

  getBasket(): Product[] {
    return this.basket;
  }

  clearBasket() {
    this.basket = [];
    console.log("Cesta vaciada"+this.basket);
  }

}
