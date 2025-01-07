//
//  CustomUIViewWrapper.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 7/1/25.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CustomUIViewWrapper: UIViewRepresentable {

    public var onLike: (() -> Void)?
    public var onShare: (() -> Void)?
    public var onComment: ((String) -> Void)?

    public init(onLike: (() -> Void)? = nil,
                onShare: (() -> Void)? = nil,
                onComment: ((String) -> Void)? = nil) {
        self.onLike = onLike
        self.onShare = onShare
        self.onComment = onComment
    }

    public func makeUIView(context: Context) -> CustomUIView {
        let view = CustomUIView()
        view.onLike = onLike
        view.onShare = onShare
        view.onComment = onComment
        return view
    }

    public func updateUIView(_ uiView: CustomUIView, context: Context) {}
}

// MARK: - Preview
@available(iOS 13.0, *)
struct CustomUIViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        CustomUIViewWrapper(
            onLike: { print("Preview: Like tapped") },
            onShare: { print("Preview: Share tapped") },
            onComment: { text in print("Preview: Comment submitted: \(text)") }
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
