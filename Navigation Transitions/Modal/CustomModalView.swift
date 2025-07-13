//
//  CustomModalView.swift
//  Navigation Transitions
//
//  Created by Karan Pal on 13/07/25.
//


import SwiftUI

struct CustomModalView: View {
    @State private var showingSettings = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Main Content")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("This is your main app content. The settings panel will slide up from the bottom when you tap the button.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    showingSettings = true
                }) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                }
            }
            .padding()
            .navigationTitle("Custom Modal")
        }
        .sheet(isPresented: $showingSettings) {
            SettingsModalView(isPresented: $showingSettings)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    CustomModalView()
}
