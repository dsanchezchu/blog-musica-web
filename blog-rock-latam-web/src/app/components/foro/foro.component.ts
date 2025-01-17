import { Component } from '@angular/core';
import { ViewEncapsulation } from '@angular/core';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-foro',
  standalone: true,
  imports: [RouterLink],
  templateUrl: './foro.component.html',
  styleUrl: './foro.component.scss',
  encapsulation: ViewEncapsulation.None,
})
export class ForoComponent {

}
