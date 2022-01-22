//
//  ViewContainingToggle.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 21/01/22.
//

import SwiftUI

struct ViewContainingToggle: View {
    @State var inspectorView: InspectorUIView?
    
    var body: some View {
        VStack {
            Text("Below the view with toggle")
            ToggleView()
                .border(.orange, width: 2.0)
            Button {
                if let inspectorView = inspectorView {
                    inspectorView.screenshot()?.saveToDocuments()
                }
                else {
                    snapshot().saveToDocuments()
                }
            } label: {
                Text("Take screenshot")
            }
        }
        .inspectView { inspectorView in
            self.inspectorView = inspectorView
        }
    }
}

struct ViewContainingToggle_Previews: PreviewProvider {
    static var previews: some View {
        ViewContainingToggle()
    }
}
