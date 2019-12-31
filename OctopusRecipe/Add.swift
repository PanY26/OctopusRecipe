//
//  Add.swift
//  OctopusRecipe
//
//  Created by Andy Y. Pan on 12/28/19.
//  Copyright © 2019 Andy Y. Pan. All rights reserved.
//

import SwiftUI
import TextView

struct Add: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var newRecipe: Recipe = Recipe(name: "", recipe: "", id: runtimeRecipeData.count)
    @State private var showingAlert = false
    @State var isEditing = false


    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("菜名")) {
                    TextField("这道菜叫什么...", text: $newRecipe.name)
                }
                Section(header: Text("工序")) {
                    TextView(text: $newRecipe.recipe, isEditing: $isEditing).frame(height:400)
                }
            }
            .navigationBarTitle(Text("新菜品"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("删除").foregroundColor(.red)
                }, trailing:
                Button(action: {
                    if self.newRecipe.name != "" && self.newRecipe.recipe != "" {
                        self.presentationMode.wrappedValue.dismiss()
                        writeData(newRecipe: self.newRecipe, arhiveURL: getURL())
                        runtimeRecipeData.append(self.newRecipe)
                    } else {
                        self.showingAlert = true
                    }
                }) {
                    Text("添加").fontWeight(.bold)
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
