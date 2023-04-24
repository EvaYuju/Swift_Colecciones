//
//  MyCustomCollectionViewCell.swift
//  S_17_Colecciones
//
//  Created by Eva Lopez Marquez on 20/4/23.
//

import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {

    // Outlets
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    // Variables
    
    let myColorYellow = "PastelYellow"
    let myColorGreen = "PastelGreen"
    let myColorPink = "PastelPink"
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Retocar estilo
        
        backgroundColor = UIColor(named: myColorYellow)
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.textColor = .systemPurple
        
    }

}
