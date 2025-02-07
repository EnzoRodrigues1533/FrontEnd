//Criar uma calculadora simples em javaScript
var prompt = require("prompt-sync")();
var numero1, numero2, resultado;
var operacao;
var continuar = true;

//Funções de operacao
 function soma(a, b) {
    return a + b;
 }
 function subtracao(a, b) {
    return a - b;
 }
 function multiplicacao(a, b) {
    return a * b;
 }
 function divisao(a, b) {
    return a / b;
 }

 while (continuar){
    console.log("Calculadora Simples");
    console.log("1.Soma");
    console.log("2.Subtração");
    console.log("3.Multiplicação");
    console.log("4.Divisão");
    console.log("5.Sair");
    operacao = Number(prompt("Informe a operação que deseja:"));
    //pedir numero
    numero1= Number(prompt("Informe o numero 1:"));
    numero2= Number(prompt("Informe o numero 2:"));
    //condição de escolha
    switch (operacao) {
        case 1:
            resultado = soma (numero1, numero2);
            console.log("O resultado é:"+ resultado)          
            break;
        case 2:
            resultado = subtracao (numero1, numero2);
            console.log("O resultado é:"+ resultado)          
        break;
        case 3:
            resultado = multiplicacao (numero1, numero2);
            console.log("O resultado é:"+ resultado)          
        break;
        case 4:
            resultado = divisao (numero1, numero2);
            console.log("O resultado é:"+ resultado)          
        break;
    
        default:
            break;
    }
 }
