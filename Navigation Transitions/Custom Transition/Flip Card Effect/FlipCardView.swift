//
//  FlipCardView.swift
//  Navigation Transitions
//
//  Created by Karan Pal on 14/07/25.
//
import SwiftUI

struct FlipCardView: View {
    @State private var isFlipped = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Flip Card Transition")
                .font(.title)
                .fontWeight(.semibold)
            
            ZStack {
                if !isFlipped {
                    CardFrontView()
                        .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
                        .transition(.flipFromLeft)
                } else {
                    CardBackView()
                        .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
                        .transition(.flipFromRight)
                }
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.4)) {
                    isFlipped.toggle()
                }
            }
            
            Text("Tap the card to flip it")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct CardFrontView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "questionmark.circle.fill")
                .font(.system(size: 50))
                .foregroundColor(.blue)
            
            Text("Question")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("What's the capital of France?")
                .font(.body)
                .multilineTextAlignment(.center)
        }
        .frame(width: 250, height: 200)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.blue, lineWidth: 2)
        )
    }
}

struct CardBackView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 50))
                .foregroundColor(.green)
            
            Text("Answer")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Paris")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.green)
        }
        .frame(width: 250, height: 200)
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.green, lineWidth: 2)
        )
    }
}

#Preview {
    FlipCardView()
}
