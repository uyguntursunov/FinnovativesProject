//
//  GuidelineViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Akramov Akbarkhon on 16/04/25.
//

import SwiftUI

class GuidelineViewModel: ObservableObject  {
    
    @Published var showGuideline: Bool = true
    @Published var currentGuideline: String = ""
    
    @Published var stories: [GuidelineBundle] = [
        GuidelineBundle(stories: [
            
            GuidelineStories(imageURL: "StoryImage1"),
            GuidelineStories(imageURL: "StoryImage2"),
            GuidelineStories(imageURL: "StoryImage3")
        ])
    ]
}
