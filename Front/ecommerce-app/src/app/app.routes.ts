import { Routes } from '@angular/router';
import { ProductItemComponent } from './product-item/product-item.component';
import { ProductComponent } from './product/product.component';

export const routes: Routes = [
    {
        path:'detalle-producto/:id_product',
        component: ProductItemComponent
    },
    {
        path:'',
        component: ProductComponent
    },
    

];
