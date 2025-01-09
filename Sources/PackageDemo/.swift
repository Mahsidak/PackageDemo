import SwiftUI

// Custom SwiftUI Wrapper for the ActionView
@available(iOS 13.0, *)
struct CustomActionViewWrapper: UIViewRepresentable {
    class Coordinator: NSObject {
        // Actions can be added here for each button if needed
        func likeTapped() {
            print("Like button tapped")
        }

        func commentTapped() {
            print("Comment button tapped")
        }

        func shareTapped() {
            print("Share button tapped")
        }
    }

    func makeUIView(context: Context) -> UIView {
        let actionView = CustomActionView()

        // Add actions to the buttons
        if let likeButton = actionView.subviews[0] as? CustomButtonView {
            likeButton.action {
                
            }
        }
        
        if let commentButton = actionView.subviews[1] as? CustomButtonView {
            commentButton.action {
                context.coordinator.commentTapped()
            }
        }
        
        if let shareButton = actionView.subviews[2] as? CustomButtonView {
            shareButton.action {
                context.coordinator.shareTapped()
            }
        }

        return actionView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Updates to the UIView can be handled here if necessary
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}

// SwiftUI view to show the CustomActionViewWrapper
struct ContentView: View {
    @available(iOS 13.0, *)
    var body: some View {
        VStack {
            Text("Custom Action View")
                .font(.title)
                .padding()

            CustomActionViewWrapper()
                .frame(height: 60)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @available(iOS 13.0, *)
    static var previews: some View {
        ContentView()
    }
}
