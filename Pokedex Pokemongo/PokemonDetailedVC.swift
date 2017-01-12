//
//  PokemonDetailedVC.swift
//  Pokedex Pokemongo
//
//  Created by Geovanny Galeano on 12/16/16.
//  Copyright © 2016 Geovanny Galeano. All rights reserved.
//

import UIKit

class PokemonDetailedVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var namedLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        namedLbl.text =  pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImg.image = img
        currentEvoImg.image = img
        pokedexIdLabel.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
            
            // Whatever we write will only be called after the network call is complete!
            self.updateUI()
        }
        
    }
    
    func updateUI () {
        
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
    }

    // to dismiss the current segue
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
   

}
