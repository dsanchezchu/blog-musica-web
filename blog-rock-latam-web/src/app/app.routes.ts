import { Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { ForoComponent } from './components/foro/foro.component';
import { CollaborateComponent } from './components/collaborate/collaborate.component';
import { LoginComponent } from './components/login/login.component';
import { HomeComponent } from './components/home/home.component';
export const routes: Routes = [
    {
        path: '', 
        redirectTo:'home',
        pathMatch:'full'
    },
    {
        path: 'home', component:HomeComponent
    },
    {
        path: 'foro', component:ForoComponent
    },
    {
        path: 'collaborate', component:CollaborateComponent
    },
    {
        path: 'login', component:LoginComponent
    },
    {
        path: 'collaborate', component:CollaborateComponent
    }
];
