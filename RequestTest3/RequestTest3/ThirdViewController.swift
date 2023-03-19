//
//  ThirdViewController.swift
//  RequestTest3
//
//  Created by Gilmar Amaro on 19/03/23.
//

import UIKit
import Alamofire

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var myTableViewTwo: UITableView!
    
    var arrayPizzaScreenThree: [PizzaElement]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewTwo()
        setupRequest()
    }
    
    func setupRequest() {
        AF.request("https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/pizza", method: .get).response { response in
            let pizza = try? JSONDecoder().decode(Pizza.self, from: response.data ?? Data())
            self.arrayPizzaScreenThree = pizza
            self.myTableViewTwo.reloadData()
        }
    }
    
    func setupTableViewTwo() {
        self.myTableViewTwo.dataSource = self
        let UINIB = UINib(nibName: "MyTableViewCellTwo", bundle: nil)
        myTableViewTwo.register(UINIB, forCellReuseIdentifier: "CellTwo")
    }
}

extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayPizzaScreenThree?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CellTwo", for: indexPath) as? MyTableViewCellTwo {
            cell.setupCellScreenThree(pizza: arrayPizzaScreenThree?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
