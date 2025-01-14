//
//  SwiftUIView.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 13/1/25.
//

import SwiftUI

@available(iOS 13.0, *)
struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text("This is a SwiftUI view")
                .font(.headline)
            CustomUIViewWrapper()
                .frame(height: 500)
                .background(Color.gray.opacity(0.2))
        }
        .padding()
    }
}

@available(iOS 13.0, *)
#Preview {
    SwiftUIView()
}
