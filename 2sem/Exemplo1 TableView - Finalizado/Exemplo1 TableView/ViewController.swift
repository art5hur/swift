//
//  ViewController.swift
//  Exemplo1 TableView
//
//  Created by Usuário Convidado on 07/08/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var minhaTableView: UITableView!
    
    var animal = ["Urso", "Girafa", "Leão", "Rinoceronte", "Elefante"]
    var foto = ["urso.png", "girafa.png", "leao.png", "rino.png", "ele.png"]
    var local = ["Europa/Ásia/América do Norte", "África", "América do Norte/África", "África/India", "Asia/África"]
    override func viewDidLoad() {
        super.viewDidLoad()
        minhaTableView.dataSource = self
        minhaTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let msg = "Você tocou no acessório do item \(indexPath.row)"
        
        let alerta = UIAlertController(
            title: "Aviso",
            message: msg,
            preferredStyle: UIAlertController.Style.alert)
        
        alerta.addAction(UIAlertAction(
            title: "Fechar",
            style: UIAlertAction.Style.default))
        
        present(alerta, animated: true)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let msg = "Você selecionou o item \(indexPath.row)"
        
        let alerta = UIAlertController(
            title: "Aviso",
            message: msg,
            preferredStyle: UIAlertController.Style.alert)
        
        alerta.addAction(UIAlertAction(
            title: "Fechar",
            style: UIAlertAction.Style.default,
            handler: { acao in
                tableView.deselectRow(at: indexPath, animated: true)
            }))
        present(alerta, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let rodape = UIImageView(image: UIImage(named: "rodape.png"))
        return rodape
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cabec = UIImageView(image: UIImage(named: "cabecalho.png"))
        return cabec
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animal.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        //celula.textLabel?.text = "Item número \(indexPath.row)"
        celula.textLabel?.text = animal[indexPath.row]
        //celula.imageView?.image = UIImage(named: "corinthians.png")
        celula.imageView?.image = UIImage(named: foto[indexPath.row])
        celula.detailTextLabel?.text = local[indexPath.row]//Para aparecer vá em Style da célula e coloque
        //o Style como Subtitle
        celula.accessoryType = .detailButton
        return celula
    }

}

