//
//  RecipeData.swift
//  OctopusRecipe
//
//  Created by Andy Y. Pan on 12/29/19.
//  Copyright © 2019 Andy Y. Pan. All rights reserved.
//

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    var name: String
    var recipe: String
    var id: Int
}


