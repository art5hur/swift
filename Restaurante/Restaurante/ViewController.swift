//
//  ViewController.swift
//  Restaurante
//
//  Created by Usuário Convidado on 10/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtMesa: UILabel!
    @IBOutlet weak var txtValorConta: UILabel!
    @IBOutlet weak var txtValorPago: UILabel!
    @IBOutlet weak var txtTroco: UILabel!
    
    @IBAction func calcular(_ sender: Any) {
        var c = Cliente()
        c.valorConta = Float(txtValorConta.text!)
        
        let vp = Float(txtValorPago.text!)
        let troco = c.pagarConta(pagamento: vp!)
        txtTroco.text = String(troco)
        
        
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

