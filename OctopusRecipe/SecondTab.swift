//
//  SecondTab.swift
//  OctopusRecipe
//
//  Created by Andy Y. Pan on 12/28/19.
//  Copyright © 2019 Andy Y. Pan. All rights reserved.
//

import SwiftUI

struct SecondTab: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: About()){
                        Text("👋🐙")
                    }.navigationBarTitle(Text("About"))
                }
                
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0")
                    }
                }
            }
        }
    }
}

struct SecondTab_Previews: PreviewProvider {
    static var previews: some View {
        SecondTab()
    }
}
