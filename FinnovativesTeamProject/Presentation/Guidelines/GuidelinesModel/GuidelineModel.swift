//
//  Model.swift
//  FinnovativesTeamProject
//
//  Created by Akramov Akbarkhon on 16/04/25.
//

import SwiftUI

struct GuidelineBundle: Identifiable, Hashable {
    var id = UUID().uuidString
    var stories: [GuidelineStories] = []
}

struct GuidelineStories: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}
