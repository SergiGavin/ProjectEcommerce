import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Product} from '../model/product.model';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  constructor(private http: HttpClient) { }

  private apiUrl = "http://localhost:8080/ecommerce/product";

  getProducts(): Observable<any>{
    return this.http.get(this.apiUrl).pipe(res=> res);
  }

  /*etProductList(): Observable<ProductResults>{
    console.log("producto: "+this.http.get<ProductResults>(this.apiUrl) )
    return this.http.get<ProductResults>(this.apiUrl).pipe(res=> res);
  }*/
}
