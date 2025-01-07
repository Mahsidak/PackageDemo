//
//  PackageDemo.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 6/1/25.
//

@MainActor
public class PackageDemoManager {
    public static let shared = PackageDemoManager()
    
    public init() {}
    
    public func createCustomUIView() -> CustomUIView {
        return CustomUIView()
    }
}
