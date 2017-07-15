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
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var pokemonImg: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var defenseLabel: UILabel!
    
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var pokedexLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var attackLabel: UILabel!
    
    @IBOutlet var currentEvoImg: UIImageView!
    
    @IBOutlet var nextEvoImg: UIImageView!

    @IBOutlet var evoLabel: UILabel!
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = pokemon.name.capitalized
        pokemonImg.image = UIImage(named: "\(pokemon.pokedexId)")
        currentEvoImg.image = UIImage(named: "\(pokemon.pokedexId)")
        
        pokemon.downloadPokemonDetails{
            //whatever is here will be called after network call is complete
            self.updateUI()
        }
        // Do any additional setup after loading the view.
    }
    func updateUI(){
        typeLabel.text = pokemon.type
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        pokedexLabel.text = "\(pokemon.pokedexId)"
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionId == ""{
            evoLabel.text = "No evolutions"
            nextEvoImg.isHidden = true
        }else{
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "\(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLabel.text = str
        }
    }

}
