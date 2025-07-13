//
//  AnyTransition+Extension.swift
//  Navigation Transitions
//
//  Created by Karan Pal on 14/07/25.
//
import SwiftUI

extension AnyTransition {
    static var slideInFromRight: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing).combined(with: .scale(scale: 0.8).combined(with: .opacity)),
            removal: .move(edge: .leading).combined(with: .scale(scale: 1.2).combined(with: .opacity))
        )
    }

    static var slideInFromLeft: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .leading).combined(with: .scale(scale: 0.8).combined(with: .opacity)),
            removal: .move(edge: .trailing).combined(with: .scale(scale: 1.2).combined(with: .opacity))
        )
    }
}

extension AnyTransition {
    static var flipFromLeft: AnyTransition {
        AnyTransition.modifier(
            active: FlipModifier(angle: -180),
            identity: FlipModifier(angle: 0)
        ).combined(with: .opacity)
    }

    static var flipFromRight: AnyTransition {
        AnyTransition.modifier(
            active: FlipModifier(angle: 180),
            identity: FlipModifier(angle: 0)
        ).combined(with: .opacity)
    }
}

struct FlipModifier: ViewModifier {
    let angle: Double

    func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(angle),
                axis: (x: 0, y: 1, z: 0),
                perspective: 0.5
            )
            .opacity(angle == 0 ? 1 : 0)
    }
}
