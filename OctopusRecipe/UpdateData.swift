//
//  UpdateData.swift
//  OctopusRecipe
//
//  Created by Andy Y. Pan on 12/30/19.
//  Copyright © 2019 Andy Y. Pan. All rights reserved.
//

import Foundation


func writeData(newRecipe: Recipe) -> URL {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let arhiveURL = documentsDirectory.appendingPathComponent("userAddedRecipes").appendingPathExtension("json")
        
    let encoder = JSONEncoder()
    let encodedRecipe = try? encoder.encode(newRecipe)
    
    try? encodedRecipe?.write(to: arhiveURL)
    print(arhiveURL)
    return arhiveURL
}

func readData(arhiveURL: URL) -> Recipe?{
    let decoder = JSONDecoder()
    let retrievedRecipeData = try? Data(contentsOf: arhiveURL)
    let decodedRecipes = try? decoder.decode(Recipe.self, from: retrievedRecipeData!)
    return decodedRecipes
}


