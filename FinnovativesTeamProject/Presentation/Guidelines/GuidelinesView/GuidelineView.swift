//
//  GuidelineView.swift
//  FinnovativesTeamProject
//
//  Created by Akramov Akbarkhon on 16/04/25.
//

import SwiftUI

struct GuidelineView: View {
    
    @EnvironmentObject var guidelineStoryData: GuidelineViewModel
    
    var body: some View {
        
        if guidelineStoryData.showGuideline {
            TabView(selection: $guidelineStoryData.currentGuideline) {
                
                ForEach($guidelineStoryData.stories) { $bundle in
                    GuidelineCardView(bundle: $bundle)
                        .environmentObject(guidelineStoryData)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.main)
            .transition(.move(edge: .bottom))
        }
    }
}

#Preview {
    GuidelineView()
        .environmentObject(GuidelineViewModel())
}
