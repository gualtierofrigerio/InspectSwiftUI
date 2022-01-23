//
//  ContainerView.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 23/01/22.
//

import SwiftUI

struct ContainerView: View {
    @State var inspectorView: InspectorUIView?
    
    var body: some View {
        VStack {
            Text("Container View")
            Spacer()
            Text("View with environment")
            ViewWithEnvironment()
            Spacer()
            Text("View with toggle")
            ViewContainingToggle()
            Spacer()
            Button {
                if let inspectorView = inspectorView {
                    inspectorView.screenshot()?.saveToDocuments()
                }
                else {
                    snapshot().saveToDocuments()
                }
            } label: {
                Text("Take screenshot ContainerView")
            }
        }
        .inspectView { inspectorView in
            self.inspectorView = inspectorView
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
