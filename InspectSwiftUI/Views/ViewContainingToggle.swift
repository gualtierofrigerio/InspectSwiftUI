//
//  ViewContainingToggle.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 21/01/22.
//

import SwiftUI

struct ViewContainingToggle: View {
    @State var image: UIImage?
    @State var inspectorView: InspectorUIView?
    
    var body: some View {
        VStack {
            Text("Below the view with toggle")
            ToggleView()
                .border(.orange, width: 2.0)
            Button {
                if let inspectorView = inspectorView {
                    image = inspectorView.screenshot()
                }
                else {
                    image = snapshot()
                }
            } label: {
                Text("Take screenshot")
            }
        }
        .inspectView { inspectorView in
            self.inspectorView = inspectorView
        }
        if let image = image {
            Image(uiImage: image)
        }
    }
}

struct ViewContainingToggle_Previews: PreviewProvider {
    static var previews: some View {
        ViewContainingToggle()
    }
}
