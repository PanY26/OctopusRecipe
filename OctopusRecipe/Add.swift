//
//  Add.swift
//  OctopusRecipe
//
//  Created by Andy Y. Pan on 12/28/19.
//  Copyright © 2019 Andy Y. Pan. All rights reserved.
//

import SwiftUI

struct Add: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var newRecipe: Recipe = Recipe(name: "", recipe: "", id: recipeData.count)
    @State private var showingAlert = false


    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("菜名")) {
                    TextField("这道菜叫什么...", text: $newRecipe.name)
                }
                Section(header: Text("工序")) {
                    TextField("这道菜怎么做...", text: $newRecipe.recipe)
                }
            }
            .navigationBarTitle(Text("\(newRecipe.name)"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    if self.newRecipe.name != "" && self.newRecipe.recipe != "" {
                        self.presentationMode.wrappedValue.dismiss()
                        let arhieveURL = writeData(newRecipe: self.newRecipe)
                        recipeData.append((readData(arhiveURL: arhieveURL)!))
                    } else {
                        self.showingAlert = true
                    }
                }) {
                    Text("添加")
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("有留白"), message: Text("请填好所有空"),
                          primaryButton:Alert.Button.destructive(Text("删除"), action: {self.presentationMode.wrappedValue.dismiss()}),
                          secondaryButton: Alert.Button.default(Text("好"), action: {print("Yes")})
                    )
                }
            )
        }
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        Add()
    }
}
