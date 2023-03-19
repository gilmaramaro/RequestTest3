//
//  SecondViewController.swift
//  RequestTest3
//
//  Created by Gilmar Amaro on 19/03/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var myLabel4: UILabel!
    
    var connectionScreen2: PizzaElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen2()
    }
    
    func setupScreen2() {
        let urlPizza = URL(string: connectionScreen2?.imageURL ?? "")
        pizzaImage.sd_setImage(with: urlPizza)
        myLabel1.text = "Pizza Pequena: R$ \(connectionScreen2?.priceP ?? 0.0)"
        myLabel2.text = "Pizza Media: R$ \(connectionScreen2?.priceM ?? 0.0)"
        myLabel3.text = "Pizza Grande: R$ \(connectionScreen2?.priceG ?? 0.0)"
        myLabel4.text = "Ver Nota Dos Clietes"
    }
    
    @IBAction func myButton(_ sender: Any) {
        if let screenTwo = storyboard?.instantiateViewController(withIdentifier: "screen3") {
            self.navigationController?.pushViewController(screenTwo, animated: true)
        }
    }
}
