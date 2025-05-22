//
//  TelaXViewController.swift
//  NavegandoEntreTelas
//
//  Created by Usuário Convidado on 15/05/25.
//

import UIKit

class TelaXViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func AbrirVerde(_ sender: Any) {
        performSegue(withIdentifier: "TelaXParaVerdeSegue", sender: nil)
    }
    
    @IBAction func abrirVermelha(_ sender: Any) {
        performSegue(withIdentifier: "TelaXParaVermelhaSegue", sender: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier ==  "TelaXParaVermelhaSegue" {
            var t = segue.destination as! TelaVermelhaViewController
            t.textoDoLabel = "Boa noite 4SIT vocês hoje estão melhores em IOS do que em fevereiro"
            }
        }
       
    

}
