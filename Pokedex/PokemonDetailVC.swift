//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Himanshu Sisodiya on 14/07/17.
//  Copyright © 2017 Himanshu Sisodiya. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon:Pokemon!
    
    @IBOutlet var nameLabel: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var pokedexLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var attackLabel: UILabel!
    
    @IBOutlet var currentEvoImg: UIImageView!
    
    @IBOutlet var nextEvoImg: UIImageView!

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
