//
//  CustomTransitionView.swift
//  Navigation Transitions
//
//  Created by Karan Pal on 14/07/25.
//


import SwiftUI

enum ActionType {
    case next
    case previous
}

struct CustomTransitionView: View {
    @State private var currentStep = 1
    @State private var actionType: ActionType = .next

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Custom Transition Demo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // This is where the magic happens
                ZStack {
                    ForEach(1...3, id: \.self) { step in
                        if step == currentStep {
                            if actionType == .next {
                                StepContentView(step: step)
                                    .transition(.asymmetric(
                                        insertion: .slideInFromRight,
                                        removal: .slideInFromRight
                                    ))
                            } else {
                                StepContentView(step: step)
                                    .transition(.asymmetric(
                                        insertion: .slideInFromLeft,
                                        removal: .slideInFromLeft
                                    ))
                            }
                        }
                    }
                }
                .frame(height: 300)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(16)
                
                HStack(spacing: 20) {
                    Button("Previous") {
                        if currentStep > 1 {
                            actionType = .previous
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                currentStep -= 1
                            }
                        }
                    }
                    .disabled(currentStep == 1)
                    
                    Button("Next") {
                        if currentStep < 3 {
                            actionType = .next
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                currentStep += 1
                            }
                        }
                    }
                    .disabled(currentStep == 3)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    CustomTransitionView()
}
