//
//  ProductCatalogView.swift
//  Navigation Transitions
//
//  Created by Karan Pal on 13/07/25.
//
import SwiftUI

struct ProductCatalogView: View {
    @Namespace private var cardTransition

    let products = [
        Product(id: 1, name: "Wireless Headphones", price: "$299", image: "https://picsum.photos/id/96/300", category: "Audio"),
        Product(id: 2, name: "Smart Watch", price: "$399", image: "https://picsum.photos/id/119/300", category: "Wearables"),
        Product(id: 3, name: "Laptop Stand", price: "$89", image: "https://picsum.photos/id/48/300", category: "Accessories"),
        Product(id: 4, name: "Bluetooth Speaker", price: "$149", image: "https://picsum.photos/id/155/300", category: "Audio")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(products) { product in
                        NavigationLink(value: product) {
                            ProductCardView(product: product)
                                .contentShape(Rectangle()) // This makes only the visible content tappable
                                .matchedTransitionSource(id: product.id, in: cardTransition)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("Products")
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
                    .navigationTransition(.zoom(sourceID: product.id, in: cardTransition))
            }
        }
    }
}

#Preview {
    ProductCatalogView()
}
