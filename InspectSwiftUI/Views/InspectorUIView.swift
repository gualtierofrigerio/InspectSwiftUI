//
//  InspectorUIView.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 21/01/22.
//

import UIKit

class InspectorUIView: UIView {
    /// Takes the screenshot of the superview of this superview
    /// - Returns: The UIImage with the screenshot of the view
    func screenshot() -> UIImage? {
        guard let containerView = self.superview?.superview else { return nil }
        let renderer = UIGraphicsImageRenderer(bounds: containerView.bounds)
        return renderer.image { (context) in
            self.layer.render(in: context.cgContext)
        }
    }
}
