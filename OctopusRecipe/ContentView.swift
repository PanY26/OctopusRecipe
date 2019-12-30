//
//  ContentView.swift
//  OctopusRecipe
//
//  Created by Andy Y. Pan on 12/28/19.
//  Copyright © 2019 Andy Y. Pan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State var modalDisplayed = false
    
    var body: some View {
        TabView(selection: $selection){
            NavigationView {
                List(recipeData) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)){
                        Text(recipe.name)
                    }
                }
                .navigationBarTitle(Text("章鱼食谱"))
                .navigationBarItems(trailing:
                    Button(action: { self.modalDisplayed = true }) {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $modalDisplayed) {
                        Add()
                    }
                )
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("食谱")
            }
            .tag(0)
            
            SecondTab().tabItem {
                VStack {
                    Image(systemName: "info")
                    Text("关于")
                }
            }
            .tag(1)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

