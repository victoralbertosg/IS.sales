import { Component, OnInit } from '@angular/core';
import {Cliente} from './cliente';
import {ClienteService} from './cliente.service';
import {Router, ActivatedRoute} from '@angular/router';
import swal from "sweetalert2"

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html'
 
})
export class FormComponent implements OnInit {

  private cliente:Cliente=new (Cliente);
  private titulo:string="Crear formulario"
  constructor(private clienteService:ClienteService, 
    private activatedRoute:ActivatedRoute,
    private router: Router) { }

  ngOnInit() {
    this.cargarCliente()
  }

  cargarCliente():void{
    this.activatedRoute.params.subscribe(params=>{
      let id=params['id']
      if (id){
        this.clienteService.getCliente(id).subscribe((cliente)=>this.cliente=cliente)
      }
    })
  }

  create(): void{
    this.clienteService.create(this.cliente).subscribe(
      cliente=>{
        this.router.navigate(['/clientes'])
        swal.fire('nuevo cliente',`Cliente ${cliente.nombre} creado con exito`,'success');
    }
    )    
  }
  update():void{
    this.clienteService.update(this.cliente)
    .subscribe(cliente=>{
      this.router.navigate(['/clientes'])
        swal.fire('Cliente actualizado',`Cliente ${cliente.nombre} atualizado con exito`,'success');
    })
  }
  
  


}
