//
//  MyTableViewCellTwo.swift
//  RequestTest3
//
//  Created by Gilmar Amaro on 19/03/23.
//

import UIKit

class MyTableViewCellTwo: UITableViewCell {
    
    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var pizzaName: UILabel!
    @IBOutlet weak var pizzaRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCellScreenThree(pizza: PizzaElement?) {
        let urlImage = URL(string: pizza?.imageURL ?? "")
        pizzaImage.sd_setImage(with: urlImage)
        pizzaName.text = pizza?.name
        pizzaRating.text = "Nota: \(pizza?.rating ?? 0)"
    }
}
