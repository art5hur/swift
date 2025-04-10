//
//  Cliente.swift
//  Restaurante
//
//  Created by Usuário Convidado on 10/04/25.
//

import Foundation

class Cliente {
    var mesa:String!
    var valorConta:Float!
    
    init() {
        self.mesa = ""
        self.valorConta = 0
    }
    
    func pagarConta(pagamento:Float)->Float{
        return pagamento - self.valorConta
    }
   
}
