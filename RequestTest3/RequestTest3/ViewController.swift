//
//  ViewController.swift
//  RequestTest3
//
//  Created by Gilmar Amaro on 19/03/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var arrayPizza: [PizzaElement]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRequest()
    }
    
    func setupRequest() {
        AF.request("https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/pizza", method: .get).response { response in
            let pizza = try? JSONDecoder().decode(Pizza.self, from: response.data ?? Data())
            self.arrayPizza = pizza
            self.myTableView.reloadData()
        }
    }
    
    func setupTableView() {
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        let UINIB = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(UINIB, forCellReuseIdentifier: "Cell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPizza?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MyTableViewCell {
            cell.setupCell(myPizza: arrayPizza?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let myScreen = storyboard?.instantiateViewController(withIdentifier: "screen2") as? SecondViewController {
            myScreen.connectionScreen2 = arrayPizza?[indexPath.row]
            self.navigationController?.pushViewController(myScreen, animated: true)
        }
    }
}
