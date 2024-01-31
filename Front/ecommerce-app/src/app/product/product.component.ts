import { Component } from '@angular/core';
import { SupplierComponent } from '../supplier/supplier.component';

@Component({
  selector: 'app-product',
  standalone: true,
  imports: [SupplierComponent],
  templateUrl: './product.component.html',
  styleUrl: './product.component.css'
})
export class ProductComponent {
  name = 'shoes';
  isLoggedIn = true;
}
