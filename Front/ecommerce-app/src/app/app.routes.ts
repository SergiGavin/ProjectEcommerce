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
        path:'nuevos/detalle-producto/:id_product',
        component: ProductItemComponent
    },
    // Añado para las ofertas 10/11/2024
    {
        path:'ofertas/detalle-producto/:id_product',
        component: ProductItemComponent
    },
    {
        path:'componentes',
        component: ComponentespcComponent
    },
    {
        path:'tarjeta_grafica',
        component: TarjetaGraficaComponent
    },
    {
        path:'placa_base',
        component: PlacaBaseComponent
    },
    {
        path:'ssd',
        component: SsdComponent
    },
    {
        path:'ram',
        component: RamComponent
    },
    {
        path:'procesadores',
        component: ProcesadoresComponent
    },
    {
        path:'refrigeracion',
        component: RefrigeracionComponent
    },
    {
        path:'tarjetas_sonido',
        component: TarjetaSonidoComponent
    },
    {
        path:'ventiladores_suple',
        component: VentiladoresSupleComponent
    },
    {
        path:'fuentes_alimentacion',
        component: FuenteAlimentacionComponent
    },
    {
        path:'ventiladores_cpu',
        component: VentiladoresCpuComponent
    },
    {
        path:'',
        component: ProductComponent
    },
    

];
