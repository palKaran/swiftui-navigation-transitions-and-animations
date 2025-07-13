//
//  StepContentView.swift
//  Navigation Transitions
//
//  Created by Karan Pal on 14/07/25.
//
import SwiftUI

struct StepContentView: View {
    let step: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: stepIcon)
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text(stepTitle)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Text(stepDescription)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
    }
    
    private var stepIcon: String {
        switch step {
        case 1: return "person.fill"
        case 2: return "heart.fill"
        case 3: return "star.fill"
        default: return "questionmark"
        }
    }
    
    private var stepTitle: String {
        switch step {
        case 1: return "Welcome!"
        case 2: return "Personalize"
        case 3: return "You're Ready!"
        default: return "Unknown"
        }
    }
    
    private var stepDescription: String {
        switch step {
        case 1: return "Let's get you started with our amazing app experience."
        case 2: return "Tell us what you're interested in so we can customize your feed."
        case 3: return "Everything is set up! You're ready to explore."
        default: return ""
        }
    }
}
