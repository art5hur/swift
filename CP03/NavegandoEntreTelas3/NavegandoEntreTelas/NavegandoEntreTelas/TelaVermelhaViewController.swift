//
//  TelaVermelhaViewController.swift
//  NavegandoEntreTelas
//
//  Created by Usuário Convidado on 15/05/25.
//

import UIKit

class TelaVermelhaViewController: UIViewController {

    
    @IBOutlet weak var lblFrase: UILabel!
    var textoDoLabel:String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblFrase.text = textoDoLabel

        // Do any additional setup after loading the view.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
