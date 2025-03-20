//
//  main.swift
//  ExercicioFIxacao
//
//  Created by Usuário Convidado on 20/03/25.
//

import Foundation

//print("Hello, World!")

var e = Enfermeira()

e.nome = "Carla"
e.coren = 1234
e.salario = 8955.25
e.graduada = true

print("Enfermeira: \(e.nome) - Coren:\(e.coren)")
print("Graduada: \(e.graduada ? "Sim" : "Não")")
print("Salário: \(e.salario)")

//métodos
//retorno de texto
e.alimentar(hora: 12, paciente: "Carlos")
//retorno de inteiro
print("Qtd de comprimidos \(e.contarComprimidos(medicamento: "Omeprazol"))")
//retorno de bool
print("Está com febre: \(e.testarFebre(Temperatura: 40))")

//(Void) sem retorno
print(e.injetarMedicamento(medicamento: "Vitamina D", paciente: "Agesandro"))

//criando objetos com o contrutor de parâmetros
var e2 = Enfermeira(nome: "Maria", coren: 32333, salario: 7888.88, graduada: true)
print("Enfermeira: \(e2.nome) - Coren:\(e2.coren)")
print("Graduada: \(e2.graduada ? "Sim" : "Não")")
print("Salário: \(e2.salario)")
