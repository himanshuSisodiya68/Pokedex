//
//  PokeCell.swift
//  Pokedex
//
//  Created by Himanshu Sisodiya on 13/07/17.
//  Copyright © 2017 Himanshu Sisodiya. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    
    var pokemon:Pokemon!
    
    //rounded corners for image
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
       
        
    }
    
    func configureCell(_ pokemon: Pokemon){
        self.pokemon = pokemon
        thumbImg.layer.masksToBounds = true
        thumbImg.layer.cornerRadius =  thumbImg.frame.width/2
        nameLabel.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
    }
    
}
