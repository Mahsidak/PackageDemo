//
//  PackageDemo.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 6/1/25.
//


import UIKit

@MainActor
class SDKInitializer {
    
    public static let shared = SDKInitializer()
    
    public static func attachView(
        to viewController: UIViewController,
        below targetView: UIView,
        withHeight height: CGFloat
    ) {
        let customView = CustomUIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        viewController.view.addSubview(customView)

        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: targetView.bottomAnchor),
            customView.leadingAnchor.constraint(equalTo: targetView.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: targetView.trailingAnchor),
            customView.bottomAnchor.constraint(lessThanOrEqualTo: viewController.view.safeAreaLayoutGuide.bottomAnchor),
            customView.heightAnchor.constraint(equalToConstant: 500)
        ])
        viewController.view.layoutIfNeeded()
    }
}
