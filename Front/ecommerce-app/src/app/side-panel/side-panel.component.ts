import { CommonModule } from '@angular/common';
import { Component, EventEmitter, Input, Output } from '@angular/core';
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

  closePanel(): void {
    this.closePanelEvent.emit();
  }
}
