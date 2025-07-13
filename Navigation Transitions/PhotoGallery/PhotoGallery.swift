//
//  PhotoGalleryModern.swift
//  Navigation Transitions
//
//  Created by Karan Pal on 13/07/25.
//


import SwiftUI

struct PhotoGallery: View {
    @Namespace private var photoTransition
    
    let photos = [
        Photo(id: 1, imageName: "https://picsum.photos/id/1/400", title: "Coder"),
        Photo(id: 2, imageName: "https://picsum.photos/id/2/400", title: "Coffee Coder"),
        Photo(id: 3, imageName: "https://picsum.photos/id/3/400", title: "Mobile Engineer"),
        Photo(id: 10, imageName: "https://picsum.photos/id/10/400", title: "Forest Path"),
        Photo(id: 20, imageName: "https://picsum.photos/id/20/400", title: "Pretty Desk"),
        Photo(id: 30, imageName: "https://picsum.photos/id/30/400", title: "Coffee Mug")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 8) {
                    ForEach(photos) { photo in
                        NavigationLink(value: photo) {
                            AsyncImage(url: URL(string: photo.imageName)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(8)
                            } placeholder: {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(8)
                            }
                        }
                        .matchedTransitionSource(id: photo.id, in: photoTransition)
                    }
                }
                .padding()
            }
            .animation(.spring())
            .navigationTitle("Photos")
            .navigationDestination(for: Photo.self) { photo in
                PhotoDetailView(photo: photo)
                    .navigationTransition(.zoom(sourceID: photo.id, in: photoTransition))
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PhotoDetailView: View {
    let photo: Photo
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: photo.imageName)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                        .frame(height: 300)
                }
                
                Text(photo.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Captured during a perfect moment when light and landscape came together. This image represents the beauty of natural photography.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
        }
        .navigationTitle(photo.title)
    }
}

struct Photo: Identifiable, Hashable {
    let id: Int
    let imageName: String
    let title: String
}

#Preview {
    PhotoGallery()
}
