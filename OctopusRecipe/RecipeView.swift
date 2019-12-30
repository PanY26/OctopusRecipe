//
//  Recipe.swift
//  OctopusRecipe
//
//  Created by Andy Y. Pan on 12/28/19.
//  Copyright © 2019 Andy Y. Pan. All rights reserved.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(recipe.name).resizable()
                .aspectRatio(contentMode: .fit)
            ScrollView{
                Text(recipe.recipe).padding().font(.body)
            }
        }
        .navigationBarTitle(Text(recipe.name))
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: recipeData[0])
    }
}
