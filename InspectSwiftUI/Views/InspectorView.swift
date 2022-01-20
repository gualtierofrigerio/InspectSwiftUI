//
//  Inspector.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 20/01/22.
//

import Foundation
import SwiftUI

class InspectorUIView: UIView {
    func getScreenshot() -> UIImage? {
        guard let containerView = self.superview?.superview else { return nil }
        return containerView.screenshot()
    }
}

typealias UIViewClosure = (InspectorUIView) -> Void

struct InspectorView: UIViewRepresentable {
    let closure: UIViewClosure
    
    init(_ closure: @escaping UIViewClosure) {
        self.closure = closure
    }
    
    func makeUIView(context: Context) -> InspectorUIView {
        let view = InspectorUIView(frame: CGRect.zero)
        return view
    }
    
    func updateUIView(_ uiView: InspectorUIView, context: Context) {
        DispatchQueue.main.async {
            closure(uiView)
        }
    }
}
