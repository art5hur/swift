//
//  Enfermeira.swift
//  ExercicioFIxacao
//
//  Created by Usuário Convidado on 20/03/25.
//

import Foundation

class Enfermeira{
    var nome:String
    var coren:Int
    var salario:Float
    var graduada:Bool
    
    init(){
        self.nome = ""
        self.coren = 0
        self.salario = 0.0
        self.graduada = false
    }
    
    init(nome:String, coren:Int, salario:Float, graduada:Bool){
        self.nome = nome
        self.coren = coren
        self.salario = salario
        self.graduada = graduada
    }
    
    func testarFebre(Temperatura:Float)->Bool{
        if Temperatura > 37.5 {
            return true
        }else{
            return false
        }
    }
    
    func contarComprimidos(medicamento:String)->Int{
        if medicamento == "Omeprazol" {
            return 2
        }else{
            return 1
        }
    }
    
    func injetarMedicamento(medicamento:String, paciente:String)->String{
        return "Aplicando \(medicamento) injetável no paciente \(paciente)"
    }
    
    func alimentar(hora:Int, paciente:String){
        if hora >= 11 && hora <= 13{
            print("Servindo o almoço para o paciente \(paciente)")
        }else if hora >= 18 && hora <= 20 {
            print("Servindo o jantar para o paciente \(paciente)")
        }
    }
}
