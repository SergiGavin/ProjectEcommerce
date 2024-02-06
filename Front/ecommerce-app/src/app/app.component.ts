import { Component} from '@angular/core';
import { RouterModule, RouterOutlet } from '@angular/router';
import { SidePanelComponent } from './side-panel/side-panel.component';
import { CommonModule } from '@angular/common';
import { ProductComponent } from './product/product.component';
import { ProductItemComponent } from './product-item/product-item.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, SidePanelComponent, CommonModule, ProductComponent, ProductItemComponent, RouterModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {

    showSidenav: boolean = false;

    toggleSidenav(): void {
      this.showSidenav = true;
    }

    closePanel(): void {
      this.showSidenav = false;
    }
    

}
