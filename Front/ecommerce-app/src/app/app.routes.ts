import { Routes } from '@angular/router';
import { ProductItemComponent } from './product-item/product-item.component';
import { ProductComponent } from './product/product.component';
import { ComponentespcComponent } from './componentespc/componentespc.component';
import { TarjetaGraficaComponent } from './listComponentsPC/tarjeta-grafica/tarjeta-grafica.component';
import { PlacaBaseComponent } from './listComponentsPC/placa-base/placa-base.component';
import { SsdComponent } from './listComponentsPC/ssd/ssd.component';
import { RamComponent } from './listComponentsPC/ram/ram.component';
import { ProcesadoresComponent } from './listComponentsPC/procesadores/procesadores.component';
import { RefrigeracionComponent } from './listComponentsPC/refrigeracion/refrigeracion.component';
import { TarjetaSonidoComponent } from './listComponentsPC/tarjeta-sonido/tarjeta-sonido.component';
import { VentiladoresSupleComponent } from './listComponentsPC/ventiladores-suple/ventiladores-suple.component';
import { FuenteAlimentacionComponent } from './listComponentsPC/fuente-alimentacion/fuente-alimentacion.component';
import { VentiladoresCpuComponent } from './listComponentsPC/ventiladores-cpu/ventiladores-cpu.component';
import { SmartphoneComponent } from './smartphone/smartphone.component';
import { PortatilComponent } from './portatil/portatil.component';
import { MonitorComponent } from './monitor/monitor.component';
import { TVComponent } from './tv/tv.component';
import { GamingComponent } from './gaming/gaming.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { PerfilComponent } from './perfil/perfil.component';
import { CestaComponent } from './cesta/cesta.component';

export const routes: Routes = [
    {
        path:'detalle-producto/:id_product',
        component: ProductItemComponent
    },
    {
        path:'nuevos',
        component: ProductComponent
    },
    {
        path:'ofertas',
        component: ProductComponent
    },
    {
        path:'ventas',
        component: ProductComponent
    },
    { 
        path: 'detalle-producto/:id_product', 
        component: ProductItemComponent 
    },
    {
        path:'componentes',
        component: ComponentespcComponent
    },
    {
        path:'category/tarjeta_grafica',
        component: TarjetaGraficaComponent
    },
    {
        path:'category/placa_base',
        component: PlacaBaseComponent
    },
    {
        path:'category/ssd',
        component: SsdComponent
    },
    {
        path:'category/ram',
        component: RamComponent
    },
    {
        path:'category/procesadores',
        component: ProcesadoresComponent
    },
    {
        path:'category/refrigeracion',
        component: RefrigeracionComponent
    },
    {
        path:'category/tarjetas_sonido',
        component: TarjetaSonidoComponent
    },
    {
        path:'category/ventiladores_suple',
        component: VentiladoresSupleComponent
    },
    {
        path:'category/fuentes_alimentacion',
        component: FuenteAlimentacionComponent
    },
    {
        path:'category/ventiladores_cpu',
        component: VentiladoresCpuComponent
    },
    {
        path:'category/smartphones',
        component: SmartphoneComponent
    },
    {
        path:'category/portatil',
        component: PortatilComponent
    },
    {
        path:'category/monitor',
        component: MonitorComponent
    },
    {
        path:'category/tv',
        component: TVComponent
    },
    {
        path:'category/gaming',
        component: GamingComponent
    },
    {
        path:'',
        component: ProductComponent
    },
    {
        path:'login',
        component: LoginComponent
    },
    {
        path:'register',
        component: RegisterComponent
    },
    {
        path:'perfil',
        component: PerfilComponent
    },
    {
        path:'cesta',
        component: CestaComponent
    }
    

];
