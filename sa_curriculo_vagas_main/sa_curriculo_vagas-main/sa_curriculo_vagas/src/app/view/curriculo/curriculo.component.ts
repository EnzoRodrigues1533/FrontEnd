import { Component } from '@angular/core';

@Component({
  selector: 'app-curriculos',
  templateUrl: './curriculo.component.html',
  styleUrls: ['./curriculos.component.css']
})
export class CurriculosComponent {
  mostrarFormulario = false;
  curriculos: any[] = [];

  formData = {
    nome: '',
    email: '',
    cargo: '',
    arquivo: null as File | null
  };

  toggleFormulario() {
    this.mostrarFormulario = true;
  }

  toggleVisualizacao() {
    this.mostrarFormulario = false;
  }

  onFileChange({ event }: { event: any; }) {
    this.formData.arquivo = event.target.files[0];
  }

  cadastrarCurriculo() {
    if (!this.formData.nome || !this.formData.email || !this.formData.cargo || !this.formData.arquivo) {
      alert('Preencha todos os campos e selecione um arquivo!');
      return;
    }
    this.curriculos.push({ ...this.formData });
    this.formData = { nome: '', email: '', cargo: '', arquivo: null };
    this.mostrarFormulario = false;
  }
}
