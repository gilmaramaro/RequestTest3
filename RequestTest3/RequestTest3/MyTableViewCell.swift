//
//  MyTableViewCell.swift
//  RequestTest3
//
//  Created by Gilmar Amaro on 19/03/23.
//

import UIKit
import SDWebImage

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePizza: UIImageView!
    @IBOutlet weak var namePizza: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(myPizza: PizzaElement?) {
        let urlPizza = URL(string: myPizza?.imageURL ?? "")
        imagePizza.sd_setImage(with: urlPizza)
        namePizza.text = myPizza?.name
    }
}
