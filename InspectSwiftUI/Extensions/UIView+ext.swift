//
//  UIView+ext.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 20/01/22.
//

import UIKit

extension UIView {
    func screenshot() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
        return renderer.image { (context) in
            self.layer.render(in: context.cgContext)
        }
    }
}
