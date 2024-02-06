import { HttpClient } from '@angular/common/http';
import { Component, inject } from '@angular/core';
import { Product } from '../model/product.model';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-product-item',
  standalone: true,
  imports: [],
  templateUrl: './product-item.component.html',
  styleUrl: './product-item.component.css'
})
export class ProductItemComponent {
  productId!: number;
  constructor(private route: ActivatedRoute, private httpClient: HttpClient) {}
  product!: Product;

  ngOnInit(): void {
    this.productId = +this.route.snapshot.paramMap.get('id_product')!;
    
    this.fetchProduct()
  }
  //Para recibir solo 1 producto.
  fetchProduct(){
    this.httpClient.get('http://localhost:8080/ecommerce/product/'+this.productId)
    .subscribe((product:any)=>{
      this.product = product;
    });
  }
  showTechDetails: boolean = false;
  flecha: string = '⬇';
  toggleTechDetails(){
    this.showTechDetails = !this.showTechDetails;
    if(this.showTechDetails){
      this.flecha = '⬆';
    }else if(!this.showTechDetails){
      this.flecha ='⬇';
    }
  }

}
/*
*/