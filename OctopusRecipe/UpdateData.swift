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
    let encodedRecipe = try? encoder.encode(runtimeRecipeData + [newRecipe])
    try? encodedRecipe?.write(to: arhiveURL)
}

func readData<Recipe: Decodable>(arhiveURL: URL) -> Recipe? {
    let decoder = JSONDecoder()
    guard let retrievedRecipeData = try? Data(contentsOf: arhiveURL) else { return nil }
    let decodedRecipes = try? decoder.decode(Recipe.self, from: retrievedRecipeData)
    return decodedRecipes
}

func removeData(removedRecipe: Recipe, arhiveURL: URL) {
    let index: Int = runtimeRecipeData.firstIndex(where: {$0 == removedRecipe})!
    runtimeRecipeData.remove(at: index)
    let encoder = JSONEncoder()
    let encodedRecipe = try? encoder.encode(runtimeRecipeData)
    try? encodedRecipe?.write(to: arhiveURL)
}


