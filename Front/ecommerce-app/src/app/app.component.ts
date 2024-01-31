import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'ecommerce-app';

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
