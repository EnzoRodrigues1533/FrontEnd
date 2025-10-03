import { Injectable } from '@angular/core';
import {HttpClient } from '@angular/common/http';
import { Vaga } from '../models/vaga.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class VagaService {
  //atributos -> localhost
  private apiUrl = "http://localhost:3007/vagas"; //caminho para o arquivo JSON
  
  constructor(private http: HttpClient) { }

  //comunicação CRUD da API (get / post / put/ delete)

  //oobter a lista de vagas (GET
  getVagas(): Observable<Vaga[]> {
    return this.http.get<Vaga[]>(this.apiUrl);
  }

  //Cadastrar
  cadastrarVaga(vaga: Vaga): Observable<Vaga[]>{
    return this.http.post<Vaga[]>(this.apiUrl, vaga);
  }
  //Aualizar
 atualizarVaga(id: any, vaga: Vaga): Observable<Vaga[]>{
    const urlAtualizar = `${this.apiUrl}/${id}`;
    return this.http.put<Vaga[]>(urlAtualizar, vaga);
  }
  //Deletar
   removerVaga(id:any): Observable<Vaga[]>{
    const urlDeletar = `${this.apiUrl}/${id}`;
    return this.http.delete<Vaga[]>(urlDeletar);
  }
}
