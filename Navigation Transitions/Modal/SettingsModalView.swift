//
//  SettingsModalView.swift
//  Navigation Transitions
//
//  Created by Karan Pal on 14/07/25.
//
import SwiftUI

struct SettingsModalView: View {
    @Binding var isPresented: Bool
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var selectedLanguage = "English"
    
    let languages = ["English", "Spanish", "French", "German"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 8) {
                    Text("Settings")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Customize your app experience")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)
                .padding(.bottom, 30)
                
                // Settings Content
                ScrollView {
                    VStack(spacing: 24) {
                        SettingsSection(title: "Preferences") {
                            SettingsRow(
                                icon: "bell.fill",
                                title: "Notifications",
                                subtitle: "Get alerts for new content"
                            ) {
                                Toggle("", isOn: $notificationsEnabled)
                                    .labelsHidden()
                            }
                            
                            SettingsRow(
                                icon: "moon.fill",
                                title: "Dark Mode",
                                subtitle: "Use dark appearance"
                            ) {
                                Toggle("", isOn: $darkModeEnabled)
                                    .labelsHidden()
                            }
                        }
                        
                        SettingsSection(title: "Language") {
                            SettingsRow(
                                icon: "globe",
                                title: "App Language",
                                subtitle: selectedLanguage
                            ) {
                                Menu(selectedLanguage) {
                                    ForEach(languages, id: \.self) { language in
                                        Button(language) {
                                            selectedLanguage = language
                                        }
                                    }
                                }
                                .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        isPresented = false
                    }
                }
            }
        }
    }
}
