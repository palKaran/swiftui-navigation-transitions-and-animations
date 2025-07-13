//
//  ProductCardView.swift
//  Navigation Transitions
//
//  Created by Karan Pal on 13/07/25.
//
import SwiftUI

struct ProductCardView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Product Image
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 200)
            }

            VStack(alignment: .leading, spacing: 8) {
                // Category Badge
                HStack {
                    Text(product.category)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)

                    Spacer()
                }

                // Product Name
                Text(product.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)

                // Price
                Text(product.price)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.05), lineWidth: 0.5)
        )
        .clipped()
    }
}
