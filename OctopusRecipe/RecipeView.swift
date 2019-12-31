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
    @Environment(\.presentationMode) private var mode: Binding<PresentationMode>
    @State private var showingAlert = true

    
    var body: some View {
        ScrollView {
            VStack {
                if UIImage(named: recipe.name) != nil {
                    Image(recipe.name).resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Text(recipe.recipe).padding()
            }
        }.navigationBarTitle(Text(recipe.name))
            .navigationBarItems(trailing:
                Button(action:{
                    removeData(removedRecipe: self.recipe, arhiveURL: getURL())
                    self.mode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "trash").foregroundColor(.red)
                })
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("已删除"), message: Text("食谱会在应用重启后消失")
                    )
                }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: recipeData[0])
    }
}
