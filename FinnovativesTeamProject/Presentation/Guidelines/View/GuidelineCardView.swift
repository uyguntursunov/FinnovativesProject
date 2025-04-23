//
//  GuidelineCardView.swift
//  FinnovativesTeamProject
//
//  Created by Akramov Akbarkhon on 21/04/25.
//

import SwiftUI

struct GuidelineCardView: View {
    
    @Binding var bundle: GuidelineBundle
    
    @EnvironmentObject var guidelineStoryData: GuidelineViewModel
    
    @State var timer = Timer.publish(every: 0.03, on: .main, in: .common).autoconnect()
    
    @State var timerProgress: CGFloat = 0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            let index = min(Int(timerProgress), bundle.stories.count - 1)
            let story = bundle.stories[index]
            Image(story.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .overlay(CloseButtonOverlay(dismissAction: {
            withAnimation {
                guidelineStoryData.showGuideline = false
                dismiss()
            }
        }), alignment: .topTrailing)
        .overlay(TimerCapsuleOverlay(bundle: $bundle, timerProgress: timerProgress), alignment: .top)
        .simultaneousGesture(createDragGesture())
        .onLongPressGesture(minimumDuration: 0.3, pressing: { isPressing in
            handleLongPressGesture(isPressing: isPressing)
        }, perform: {})
        .onAppear {
            timerProgress = 0
        }
        .onReceive(timer) { _ in
            handleTimerTick()
        }
    }
    
    
    // MARK: - Private Helpers
    
    private func createDragGesture() -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onEnded { value in
                let screenWidth = UIScreen.main.bounds.width
                let quarterWidth = screenWidth / 4
                
                if value.location.x < quarterWidth {
                    let currentIndex = Int(timerProgress)
                    if currentIndex > 0 {
                        timerProgress = CGFloat(currentIndex - 1)
                    }
                } else if value.location.x > screenWidth - quarterWidth {
                    let currentIndex = Int(timerProgress)
                    if currentIndex < bundle.stories.count - 1 {
                        timerProgress = CGFloat(currentIndex + 1)
                    } else {
                        withAnimation {
                            guidelineStoryData.showGuideline = false
                            dismiss()
                        }
                    }
                }
            }
    }
    
    private func handleLongPressGesture(isPressing: Bool) {
        if isPressing {
            timer.upstream.connect().cancel()
        } else {
            timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        }
    }
    
    private func handleTimerTick() {
        if timerProgress < CGFloat(bundle.stories.count) {
            timerProgress += 0.01
        } else {
            withAnimation {
                guidelineStoryData.showGuideline = false
                dismiss()
                timer.upstream.connect().cancel()
            }
        }
    }
    
    // MARK: - Private Overlay Views
    
    private struct CloseButtonOverlay: View {
        let dismissAction: () -> Void
        var body: some View {
            Button(action: dismissAction) {
                Image(systemName: IS.xmark.rawValue)
                    .font(.title2)
                    .foregroundStyle(Color.white)
            }
            .padding()
        }
    }
    
    private struct TimerCapsuleOverlay: View {
        @Binding var bundle: GuidelineBundle
        let timerProgress: CGFloat
        
        init(bundle: Binding<GuidelineBundle>, timerProgress: CGFloat) {
            self._bundle = bundle
            self.timerProgress = timerProgress
        }
        
        var body: some View {
            HStack(spacing: 5) {
                ForEach(bundle.stories.indices, id: \.self) { index in
                    GeometryReader { proxy in
                        let width = proxy.size.width
                        let progress = timerProgress - CGFloat(index)
                        let perfectProgress = min(max(progress, 0), 1)
                        Capsule()
                            .fill(.gray.opacity(0.5))
                            .overlay(
                                Capsule()
                                    .fill(.white)
                                    .frame(width: width * perfectProgress),
                                alignment: .leading
                            )
                    }
                }
            }
            .frame(height: 1.4)
            .padding(.horizontal)
            .padding(.top, 5)
        }
    }
}
