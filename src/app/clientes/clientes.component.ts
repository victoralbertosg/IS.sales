import { Component, OnInit } from '@angular/core';
import {Cliente} from './cliente';
import {ClienteService} from './cliente.service';
import swal from "sweetalert2";


@Component({
  selector: 'app-clientes',
  templateUrl: './clientes.component.html'  
})
export class ClientesComponent implements OnInit {
  clientes:Cliente[];

  constructor(private clienteService:ClienteService) { }

  ngOnInit() {
    //this.clientes=this.clienteService.getClientes();
    this.clienteService.getClientes().subscribe(
      (clientes)=>this.clientes=clientes
    );
  }

  delete (cliente:Cliente):void{
    const swalWithBootstrapButtons = swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: false
    })
    
    swalWithBootstrapButtons.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, cancel!',
      reverseButtons: true
    }).then((result) => {
      if (result.value) {
        this.clienteService.delete(cliente.id).subscribe(
          response=>{
            this.clientes=this.clientes.filter(cli=>cli!==cliente)
            swalWithBootstrapButtons.fire(
              'Cliente Eliminado',
              'Your file has been deleted.',
              'success'
            )
          }
        )
        
      } else if (
        /* Read more about handling dismissals below */
        result.dismiss === swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire(
          'Cancelado',
          'su archivo esta guardado :)',
          'error'
        )
      }
    })
  }

}
