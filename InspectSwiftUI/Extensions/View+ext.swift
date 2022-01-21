//
//  View+ext.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 20/01/22.
//

import Foundation
import SwiftUI

extension View {
    /// from HWS take a screenshot by wrapping the View inside a UIHostingController
    /// then create a UIImage from a UIGraphicsImageRenderer
    func snapshot(environment: SharedModel) -> UIImage {
        let controller = UIHostingController(rootView: self.environmentObject(environment))
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
    
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

extension View {
    func inspectView(_ closure: @escaping UIViewClosure) -> some View {
        let inspectorView = InspectorView(closure)
        return overlay(inspectorView.frame(width: 0, height: 0))
    }
}
