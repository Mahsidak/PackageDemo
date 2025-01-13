//
//  CustomUIViewWrapper.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 7/1/25.
//

import SwiftUI
import UIKit

@available(iOS 13.0, *)
struct CustomUIViewWrapper: UIViewRepresentable {
    // MARK: - Coordinator
    class Coordinator: NSObject {
        var parent: CustomUIViewWrapper
        
        init(parent: CustomUIViewWrapper) {
            self.parent = parent
        }
    }
    
    // MARK: - UIViewRepresentable Protocol
    func makeUIView(context: Context) -> CustomUIView {
        let customView = CustomUIView()
        return customView
    }
    
    func updateUIView(_ uiView: CustomUIView, context: Context) {
        // Update the UIKit view if needed when SwiftUI state changes
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}

// MARK: - SwiftUI Preview
@available(iOS 13.0, *)
struct CustomUIViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        CustomUIViewWrapper()
            .frame(height: 150) // Adjust the frame height to suit your design
            .previewLayout(.sizeThatFits)
    }
}
