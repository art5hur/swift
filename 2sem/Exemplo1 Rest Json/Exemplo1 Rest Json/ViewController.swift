//
//  ViewController.swift
//  Exemplo1 Rest Json
//
//  Created by Usuário Convidado on 04/09/25.
//

import UIKit

var comic:Comic!=nil


class ViewController: UIViewController {
    
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblTitulo: UILabel!
    
    @IBOutlet weak var minhaImagem: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exibir(_ sender: Any) {
        loadComic()
    }
    
    
    func loadComic(){
        let jsonURLString = "https://xkcd.com/info.0.json"
        let url = URL(string: jsonURLString)
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else {return}
            
            do{
                comic = try JSONDecoder().decode(Comic.self, from: data)
                //print(comic.title)
                DispatchQueue.main.sync {
                    self.lblTitulo.text = comic.title
                    self.lblId.text = String(comic.num)
                    self.lblData.text = comic.day + "/" + comic.month + "/" + comic.year
                }
            }catch let jsonError{
                print("Error de serialização do Json", jsonError)
            }
        }
        .resume()
    }
    
    
}

