//Tipos de Dados

var nome = "Enzo"; //tipo texto (String)
var idade = 18; //tipo inteiro (number)
var nota = 9.6; //tipo decimal (number)
var data ; //tipo indefinido (undefined)
aprovado = true; //tipo boleana (boolean)
var diploma = null; //tipo nula (null)

//Variáveis e Constantes (var, let, const)
var nota = 5; //declarar
nota1 = 7; //redefini
var nota1 = 10; //redeclarar

let nota2 = 8; //declarar
nota2 = 9; //redefinido
//let nota2 = 10; //erro -redeclarar

const media = 7.5; //declarar
//media = 8; // erro - redefinir
//const media = 8; //erro -redeclarar

//Operadores Aritmeticos
let a = 10;
let b = 3;
console.log(a+b);//13
console.log(a-b);//7
console.log(a*b);//30
console.log(a/b);//3.33
console.log(a%b);//1


console.log(5<10);//true
console.log("10" ==10);//true
console.log("10" ===10);//false


//Operadores Logicos (E&&,OU||,Nao!)

var notaa = 5;
var notab = 7;

console.log(notaa >=7 || notab >= 7);//true
console.log(notaa >=7 && notab >= 7);//false
console.log(!true);//false

//Condicionais (if/else switch(case))

var idade =25;
if (idade>=18){
    console.log("Maior de idade");
}else {
    console.log("Menor de idade");
}

var mes =2;
switch (key) {
    case 1 :
        console.log("Janeiro");  
        break;
        case 1 :
            console.log("Fevereiro");  
            break;
    default:
        console.log("Outro Mês");  
        break;
}

//Loops (for/ while/ dowhile)

for (let i = 0; i < 5; i++) {
    console.log("iteração:"+i);
}

var condition = true;
var numero = 3;
var contador = 0;
while (condition) {
    let sorteio = Math.random(5)
    contador ++
    if (numero ==sorteio) {
        console.log("Acertou com "+ contador +"Tentativas");
        condition =false;
        
    }
}

// Funções - function

function saudacao(nome){

    return "Olá"+nome

}
console.log(saudacao("Enzo"));