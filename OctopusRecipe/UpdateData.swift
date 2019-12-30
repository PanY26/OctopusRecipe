//
//  UpdateData.swift
//  OctopusRecipe
//
//  Created by Andy Y. Pan on 12/30/19.
//  Copyright © 2019 Andy Y. Pan. All rights reserved.
//

import Foundation

func getURL () -> URL {
    return UserDefaults.standard.url(forKey: "arhiveURL") ?? setURL()
}

func setURL () -> URL {
    let fileManager = FileManager.default
    let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    let arhiveURL = documentsDirectory.appendingPathComponent("userAddedRecipes").appendingPathExtension("json")
    UserDefaults.standard.set(arhiveURL, forKey: "arhiveURL")
    return arhiveURL
}

func writeData(newRecipe: Recipe, arhiveURL: URL) {
    let encoder = JSONEncoder()
    let encodedRecipe = try? encoder.encode([newRecipe] + runtimeRecipeData)
    try? encodedRecipe?.write(to: arhiveURL)
}

func readData<Recipe: Decodable>(arhiveURL: URL) -> Recipe? {
    let decoder = JSONDecoder()
    let retrievedRecipeData = try? Data(contentsOf: arhiveURL)
    let decodedRecipes: Recipe? = try? decoder.decode(Recipe.self, from: retrievedRecipeData!)
    return decodedRecipes
}


