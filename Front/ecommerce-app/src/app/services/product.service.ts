import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, tap } from 'rxjs';
import { Product} from '../model/product.model';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  

  private apiUrl = "http://localhost:8080/ecommerce/product";

  //Centralizamos los datos en el service para poder utilizarlos en el resto de la web.
  private productsSubject = new BehaviorSubject<Product[]>([]); //Guardamos los productos en un BehaviorSubject para que se pueda subscribir a los cambios.
  public productsServ = this.productsSubject.asObservable(); //Lo ponemos como "observable" para que otros componentes puedas recibir los productos.

  constructor(private http: HttpClient) { } //Inyectamos el HttpClient para poder hacer peticiones HTTP(CRUD).

  //Metodos para obtener los productos desde el backend y actualizar el BehaviorSubject.
  getAllProducts(): Observable<Product[]> {
    return this.http.get<Product[]>(this.apiUrl).pipe( //.pipe --> permite encadenar operadores RxJS.
      tap(products => this.productsSubject.next(products)) // tap --> permite ejecutar una función con el resultado de la petición HTTP. 
      // En este caso actualizamos el BehaviorSubject con los productos obtenidos.
    );
  }

  getNewProducts(): Observable<Product[]> {
    return this.http.get<Product[]>(`${this.apiUrl}/nuevos`).pipe(
      tap(products => this.productsSubject.next(products))
    );
      
  }

  getOffers(): Observable<Product[]> {
    return this.http.get<Product[]>(`${this.apiUrl}/ofertas`).pipe(
      tap(products => this.productsSubject.next(products))
    );
  }

  getBestSellers(): Observable<Product[]> {
    return this.http.get<Product[]>(`${this.apiUrl}/ventas`).pipe(
      tap(products => this.productsSubject.next(products))
    );
  }
  getProductById(id: number): Observable<Product> {
    return this.http.get<Product>(`${this.apiUrl}/${id}`);
  }








  /*getProducts(): Observable<any>{
    return this.http.get(this.apiUrl).pipe(res=> res);
  }*/

  /*etProductList(): Observable<ProductResults>{
    console.log("producto: "+this.http.get<ProductResults>(this.apiUrl) )
    return this.http.get<ProductResults>(this.apiUrl).pipe(res=> res);
  }*/
}
