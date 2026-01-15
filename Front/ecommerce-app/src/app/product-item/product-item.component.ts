import { HttpClient } from '@angular/common/http';
import { Component, inject } from '@angular/core';
import { Product } from '../model/product.model';
import { ActivatedRoute } from '@angular/router';
import { ProductService } from '../services/product.service';
import { CommonModule } from '@angular/common';
import { BasketService } from '../services/basket.service';


@Component({
  selector: 'app-product-item',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './product-item.component.html',
  styleUrl: './product-item.component.css'
})
export class ProductItemComponent {
  productId!: number;
  product!: Product;

  showTechDetails: boolean = false;
  flecha: string = '⬇';

  constructor(private route: ActivatedRoute, private productService: ProductService, private basketService: BasketService) {}
  
  ngOnInit(): void {
  this.route.paramMap.subscribe(params => { //Reacciona cada vez que se cambia el parametro de la ruta.
    this.productId = +params.get('id_product')!;
    // this.productId = +this.route.snapshot.paramMap.get('id_product')!; --> Esto solo lee el parametro una vez, no se actualiza al cambiar de ruta.
    this.fetchProduct();
    
  });
  

}
  fetchProduct() {
    this.productService.getProductById(this.productId).subscribe(product => {
      this.product = product;
    });
  }
  
  toggleTechDetails(){
    this.showTechDetails = !this.showTechDetails;
    if(this.showTechDetails){
      this.flecha = '⬆';
    }else if(!this.showTechDetails){
      this.flecha ='⬇';
    }
  }
  addToBasket(){
    this.basketService.addToBasket(this.product);
    console.log("Producto añadido:", this.product);
    

  }
}