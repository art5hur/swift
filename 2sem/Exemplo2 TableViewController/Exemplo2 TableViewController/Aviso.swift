//
//  Aviso.swift
//  Exemplo2 TableViewController
//
//  Created by Usuário Convidado on 21/08/25.
//

import UIKit

class Aviso: NSObject {

    static func exibirMensagem(msg:String, sender:UIViewController){
        
        let alerta = UIAlertController(
            title: "Aviso",
            message: msg,
            preferredStyle: UIAlertController.Style.alert)
        
        alerta.addAction(UIAlertAction(
            title: "Fechar",
            style: UIAlertAction.Style.default))
        
        sender.present(alerta, animated: true)
        
    
        
    }
    
}
