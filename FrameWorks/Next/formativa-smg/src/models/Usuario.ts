//classe de modelagem de dados para Usuários

import mongoose, { Document, Model, Schema } from "mongoose";

export interface IUsuario extends Document{
    _id: string;
    nome:string;
    email:string;
    senha:string;
}

const UsuarioSchema:Schema<IUsuario> = new Schema({
    nome: {type: String, required: true},
    email: {type: String, required: true, unique:true},
    senha: {type: String, required: true}
});

//toMap // FromMap
const Usuario: Model<IUsuario> = mongoose.models.User 
|| mongoose.model<IUsuario>("Usuario", UsuarioSchema);

export default Usuario;
