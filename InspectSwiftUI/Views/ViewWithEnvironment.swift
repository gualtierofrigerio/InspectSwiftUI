//
//  ViewWithEnvironment.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 23/01/22.
//

import SwiftUI

struct ViewWithEnvironment: View {
    @EnvironmentObject var sharedModel: SharedModel
    @State var image: UIImage?
    @State var inspectorView: InspectorUIView?
    
    var body: some View {
        VStack {
            Text("Counter = \(sharedModel.counter)")
            Button {
                if let inspectorView = inspectorView {
                    image = inspectorView.screenshot()
                }
                else {
                    image = self.snapshot(environment: sharedModel)
                }
            } label: {
                Text("take snapshot")
            }
        }
        .inspectView { inspectorView in
            self.inspectorView = inspectorView
        }
        Text("See the screenshot below")
        if let image = image {
            Image(uiImage: image)
        }
    }
}

struct ViewWithEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        ViewWithEnvironment()
    }
}
