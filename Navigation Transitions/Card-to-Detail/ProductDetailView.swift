//
//  ProductDetailView.swift
//  Navigation Transitions
//
//  Created by Karan Pal on 13/07/25.
//
import SwiftUI

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Hero Image - same as card but bigger
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 300)
                }

                VStack(alignment: .leading, spacing: 16) {
                    // Enhanced Category Badge
                    HStack {
                        Text(product.category)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.blue)
                            .cornerRadius(12)

                        Spacer()
                    }

                    // Product Name - larger in detail
                    Text(product.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    // Price - emphasized with color
                    Text(product.price)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)

                    // Product Description
                    Text("Premium quality product designed with attention to detail. Perfect for everyday use with modern aesthetics and reliable performance.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(4)

                    // Features Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Features")
                            .font(.headline)
                            .fontWeight(.semibold)

                        FeatureRow(icon: "checkmark.circle.fill", text: "High-quality materials")
                        FeatureRow(icon: "checkmark.circle.fill", text: "1-year warranty included")
                        FeatureRow(icon: "checkmark.circle.fill", text: "Free shipping worldwide")
                    }

                    Spacer(minLength: 100)
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
        .overlay(alignment: .bottom) {
            // Add to Cart Button
            Button(action: {}) {
                Text("Add to Cart - \(product.price)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .background(
                Color(.systemBackground)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
            )
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.green)
                .frame(width: 20)

            Text(text)
                .font(.body)
        }
    }
}
