//
//  ViewWithEnvironment.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 23/01/22.
//

import SwiftUI

struct ViewWithEnvironment: View {
    @EnvironmentObject var sharedModel: SharedModel
    @State var inspectorView: InspectorUIView?
    
    var body: some View {
        VStack {
            Text("Counter = \(sharedModel.counter)")
            Button {
                if let inspectorView = inspectorView {
                    inspectorView.screenshot()?.saveToDocuments()
                }
                else {
                    self.snapshot().saveToDocuments()
                }
            } label: {
                Text("Take screenshot inside ViewWithEnvironment")
            }
        }
        .inspectView { inspectorView in
            self.inspectorView = inspectorView
        }
    }
}

struct ViewWithEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        ViewWithEnvironment()
    }
}
