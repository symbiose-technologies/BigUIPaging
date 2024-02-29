import SwiftUI

/// An example of how to use page view with next and previous closures.
struct PageViewBasicExample: View {
    
    @State private var selection: Int = 1
    
    
    var body: some View {
        PageView(selection: $selection, explicitStyle: Optional<PlainPageViewStyle>.none) { value in
            value + 1
        } previous: { value in
            value > 1 ? value - 1 : nil
        } content: { value in
            ExamplePage(value: value)
                .transition(.scale(scale: 0.2))
                .animation(.easeIn(duration: 4), value: selection)
        }
        .ignoresSafeArea()
        #if os(iOS)
        .overlay(alignment: .bottom) {
            PageIndicator(
                selection: $selection,
                total: 100
            )
            .pageIndicatorBackgroundStyle(.prominent)
        }
        #endif
    }
}
struct SPageViewBasicExample<S: PageViewStyle>: View {
    
    @State private var selection: Int = 1
    var style: S
    
    var body: some View {
        PageView(selection: $selection, explicitStyle: style) { value in
            value + 1
        } previous: { value in
            value > 1 ? value - 1 : nil
        } content: { value in
            VStack {
                ExamplePage(value: value)
                    .transition(.move(edge: .bottom))
            }
//                .transition(AnyTransition.slide.animation(.easeInOut(duration: 0.2)))
//                .transition(AnyTransition.scale(scale: 0.2).animation(.easeInOut(duration: 0.2)))

//                .transition(.scale(scale: 0.2))

        }
        
        .ignoresSafeArea()
        #if os(iOS)
        .overlay(alignment: .bottom) {
            PageIndicator(
                selection: $selection,
                total: 100
            )
            .pageIndicatorBackgroundStyle(.prominent)
        }
        #endif
        .animation(.easeIn(duration: 0.1), value: selection)

    }
}

// MARK: - Preview

struct PageViewBasicExample_Previews: PreviewProvider {
    
    static var previews: some View {
        PageViewBasicExample()
            .pageViewStyle(.scroll)
        VStack {
            SPageViewBasicExample(style: PlainPageViewStyle())
        }
//            .pageViewStyle(.scroll)
    }
}

// MARK: - Content

struct ExamplePage: View {
    
    let value: Int
    
    var body: some View {
//        let _ = Self._printChanges()
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                Rectangle()
                    .fill(value.color)
                    .ignoresSafeArea()
                Image(systemName: "\(value).circle.fill")
                    .font(.system(size: geometry.size.height / 4))
                    .foregroundStyle(.white)
            }
        }
    }
}

extension Int {
    
    var color: Color {
        switch self % 10 {
        case 0: return .pink
        case 1: return .red
        case 2: return .orange
        case 3: return .yellow
        case 4: return .green
        case 5: return .mint
        case 6: return .teal
        case 7: return .blue
        case 8: return .indigo
        case 9: return .purple
        default: return .gray
        }
    }
}
