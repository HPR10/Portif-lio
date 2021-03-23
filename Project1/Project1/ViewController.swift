//
//  ViewController.swift
//  Project1
//
//  Created by HP on 15/03/21.
//

import UIKit

class ViewController: UITableViewController {
    
    // Array vazio de str
    var pictures = [String]()

    // Método de carregamento da View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "View Picture"
        navigationController?.navigationBar.prefersLargeTitles = true
       
        // Configuração para pegar arquivos no mesmo diretório que o projeto
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // Percorrendo items e verficando quem tem o nome nssl e adicionando ao array
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        // Imprimindo no console o retorno do For
        print(pictures)
    }
    
    // Método para contar a quantidade de linhas pelo número de itens no array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // método para contar o número de células e exibir na tela as células com o indentificador passado como parâmetro
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

