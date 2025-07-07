import { Component, inject, OnInit, ViewChild,ElementRef} from '@angular/core';
import { Router, RouterModule, RouterOutlet } from '@angular/router';
import { SidePanelComponent } from './side-panel/side-panel.component';
import { CommonModule } from '@angular/common';
import { ProductComponent } from './product/product.component';
import { ProductItemComponent } from './product-item/product-item.component';
import { HttpClient } from '@angular/common/http';
import { Product } from './model/product.model';
import { ProductService } from './services/product.service';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, SidePanelComponent, CommonModule, RouterModule, FormsModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit {
  
@ViewChild('searchInput') searchInput!: ElementRef;

  products: Product[] = [];
  filteredProducts: Product[] = [];
  //Injectamos el servicio para poder obtener los productos.
  constructor(private productService: ProductService,private router: Router) {}

    showSidenav: boolean = false;
    isFocusedSearch: boolean = false;

    toggleSidenav(): void {
      this.showSidenav = true;
    }

    closePanel(): void {
      this.showSidenav = false;
    }  
    
    ngOnInit(): void {
    this.productService.productsServ.subscribe(products => {
      this.products = products;
      this.filteredProducts= products;
    });
  }
  searchProducts(event: Event): void {
    const input = event.target as HTMLInputElement; 
    const searchProduct = input.value.toLowerCase().trim();
    this.isFocusedSearch = true;
    this.filteredProducts = this.products.filter(product =>
      product.product_name.toLowerCase().includes(searchProduct)
    );
    console.log("Productos filtrados:     ",this.filteredProducts);
  }
  onBlur(): void {
  setTimeout(() => {
    this.isFocusedSearch = false;
    this.filteredProducts = [];
  }, 200);
}
selectProduct(product: Product): void {
  this.searchInput.nativeElement.value = '';
  this.filteredProducts = [];
  this.isFocusedSearch = false;
  this.router.navigate(['/detalle-producto', product.id_product]);
}

}
