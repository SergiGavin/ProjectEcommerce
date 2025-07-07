import { CommonModule } from '@angular/common';
import { Component, ElementRef, EventEmitter, HostListener, Input, Output } from '@angular/core';
import { AppComponent } from '../app.component';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-side-panel',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './side-panel.component.html',
  styleUrl: './side-panel.component.css'
})
export class SidePanelComponent {
  @Output() closePanelEvent = new EventEmitter<void>();

  private justOpened = true;

  constructor(private el: ElementRef) { //Creo constructor para poder hacer referencia al alemento HTML
    // Hacemos que se espere un poco antes de permitir el cierre para controlar que no se cierre al momento de abrirlo.
    setTimeout(() => {
      this.justOpened = false;
    });
  }
  //Controlamos todos los clicks 
  @HostListener('document:click', ['$event'])
  onClickOutside(event: MouseEvent): void {
    // Evita cerrar inmediatamente tras abrir
    if (this.justOpened){
      return;
    } 

    const clickedInside = this.el.nativeElement.contains(event.target);
    if (!clickedInside) {
      this.closePanel();
    }
  }





  closePanel(): void {
    this.closePanelEvent.emit();
  }


}
