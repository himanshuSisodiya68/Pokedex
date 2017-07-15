//
//  Pokemon.swift
//  Pokedex
//
//  Created by Himanshu Sisodiya on 13/07/17.
//  Copyright © 2017 Himanshu Sisodiya. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon{
    
    private var _name:String!
    private var _pokedexId:Int!
    private var _description:String!
    private var _type:String!
    private var _height:String!
    private var _weight:String!
    private var _defense:String!
    private var _attack:String!
    private var _nextEvolutionTxt:String!
    private var _pokemonURL:String!
    
    var description:String{
        if _description == nil{
            _description = ""
        }
        return _description
    }
    var type:String{
        if _type == nil{
            _type = ""
        }
        return _type
    }
    var height:String{
        if _height == nil{
            _height = ""
        }
        return _height
    }
    var weight:String{
        if _weight == nil{
            _weight = ""
        }
        return _weight
    }
    var defense:String{
        if _defense == nil{
            _defense = ""
        }
        return _defense
    }
    
    var attack:String{
        if _attack == nil{
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolutionTxt:String{
        if _nextEvolutionTxt == nil{
            _nextEvolutionTxt = ""
        }
        return _nextEvolutionTxt
    }
    
    var name:String{
        return _name
    }
    
    var pokedexId:Int{
        return _pokedexId
    }
    
    init(name:String, pokedexId:Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
        //print(self._pokemonURL)
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete){
        Alamofire.request(_pokemonURL).responseJSON{(response) in
            if let dict = response.result.value as? Dictionary<String, AnyObject>{
                if let weight = dict["weight"] as? String{
                    self._weight = weight
                }
                if let height = dict["height"] as? String{
                    self._height = height
                }
                if let attack = dict["attack"] as? Int{
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int{
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String,String>], types.count>0{
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    if types.count > 1{
                        for x in 1..<types.count{
                            if let name = types[x]["name"]{
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                }else{
                    self._type = ""
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>], descArr.count>0{
                    if let url = descArr[0]["resource_uri"]{
                        let descURL = "\(URL_BASE)\(url)"
                        Alamofire.request(descURL).responseJSON(completionHandler:{(reponse) in
                            if let descDict = response.result.value as? Dictionary<String, AnyObject>{
                                if let description = descDict["description"] as? String{
                                    print(description)
                                    self._description = description
                                }
                            }
                            completed()
                        })
                    }else{
                        self._description = "Description not fetched!"
                    }
                }
            }
            completed()
            //print(response)
        }
    }
    
}
