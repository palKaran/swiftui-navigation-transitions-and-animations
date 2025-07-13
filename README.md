# SwiftUI Navigation Transitions

A comprehensive collection of modern navigation transitions for SwiftUI applications, featuring practical examples from photo galleries to custom modal presentations.

## 📱 What's Inside

This project demonstrates various navigation transition techniques in SwiftUI, organized into practical, real-world examples that you can integrate into your own apps.

### 🖼️ Photo Gallery
Modern iOS 18+ zoom transitions for image browsing
- Smooth zoom effects between grid and detail views
- Built-in `.navigationTransition(.zoom)` implementation
- Perfect for media apps and portfolios

### 📦 Card-to-Detail Transitions
E-commerce style product catalog with seamless expansions
- Product grid with custom card designs
- Smooth transitions from card to detail view
- Practical implementation for content-heavy apps

### 🎭 Custom Modal Presentations
Beyond basic sheets - contextual modal presentations
- Settings panels with slide-up animations
- Custom detent support for half-sheet modals
- Proper backdrop and dismissal handling

### 🔧 Custom Transition Effects
Hand-built transitions for unique experiences
- **Flip Card Effect**: Perfect for flashcards and reveals
- **Slide-and-Scale**: Sequential content flows
- **Expand-from-Corner**: Contextual overlays
- Cross-platform compatible implementations

## 🚀 Getting Started

1. Clone the repository
2. Open `Navigation Transitions.xcodeproj` in Xcode 15+
3. Build and run on iOS 17+ (iOS 18+ for zoom transitions)
4. Explore each section in the app

## 📁 Project Structure

```
Navigation Transitions/
├── Card-to-Detail/
│   ├── Product.swift                 # Data model
│   ├── ProductCatalogView.swift      # Main grid view
│   ├── ProductCardView.swift         # Individual card component
│   └── ProductDetailView.swift       # Detail view with features
├── Custom Transition/
│   ├── Flip Card Effect/
│   │   └── FlipCardView.swift        # 3D flip animation
│   ├── Slide-and-Scale/
│   │   ├── CustomTransitionView.swift # Container view
│   │   └── StepContentView.swift     # Content components
│   └── AnyTransition+Extension.swift # Custom transition definitions
├── Modal/
│   ├── CustomModalView.swift         # Main modal trigger
│   ├── SettingsModalView.swift       # Settings panel implementation
│   ├── SettingsSection.swift         # Reusable section component
│   └── SlideInModalView.swift        # Custom slide animations
├── PhotoGallery/
│   └── PhotoGallery.swift            # iOS 18+ zoom transitions
└── Navigation_TransitionsApp.swift   # App entry point
```

## 🎯 Key Features

- **iOS 18+ Support**: Latest navigation transition APIs
- **Backward Compatibility**: Custom implementations for older iOS versions
- **Performance Optimized**: Tested on various device configurations
- **Accessibility Ready**: Respects reduced motion preferences
- **Production Ready**: Real-world patterns you can ship

## 🛠️ Requirements

- **Xcode**: 15.0+
- **iOS Deployment Target**: 17.0+
- **Swift**: 5.9+

## 💡 Usage Examples

### Photo Gallery Zoom Transition
```swift
NavigationLink(value: photo) {
    PhotoCardView(photo: photo)
}
.navigationTransition(.zoom(sourceID: photo.id, in: photoTransition))
```

### Custom Card Expansion
```swift
NavigationLink(value: product) {
    ProductCardView(product: product)
        .matchedTransitionSource(id: product.id, in: cardTransition)
}
```

### Modal with Custom Detents
```swift
.sheet(isPresented: $showingSettings) {
    SettingsModalView(isPresented: $showingSettings)
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
}
```

## 🎨 Customization

Each transition example is modular and customizable:

- **Animation Timing**: Adjust spring parameters and durations
- **Visual Effects**: Modify colors, shadows, and corner radius
- **Content Layout**: Adapt card designs and detail views
- **Accessibility**: Built-in reduced motion support

## 📖 Learn More

This project accompanies the comprehensive guide on SwiftUI navigation transitions. Each example includes:

- **Performance considerations** for smooth animations
- **Accessibility best practices** for inclusive design
- **Real-world implementation tips** from production apps
- **Common pitfalls** and how to avoid them

## 🤝 Contributing

Found an issue or want to add a new transition pattern? 

1. Fork the repository
2. Create a feature branch
3. Add your transition with proper documentation
4. Submit a pull request

## 📺 More Resources

For video tutorials and live coding sessions, check out [Swift Pal](https://youtube.com/@swift-pal) where we build these transitions step-by-step.

Feel free to use these patterns in your own apps!

---

**Ready to make your SwiftUI navigation feel smooth and professional? Start with one pattern and expand from
