//Criar um Contador até 100

for(let i = 1; i<=100;i++){
    console.log(i);
}

//verificar se um numero é impar ou par 
var prompt = require("prompt-sync")();
var numero;
numero = prompt("Digite um Número:");
if (numero%2==0){
    console.log("par");
}else {
    console.log("Ímpar");
}