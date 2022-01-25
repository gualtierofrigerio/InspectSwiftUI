//
//  ContainerView.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 23/01/22.
//

import SwiftUI

struct ContainerView: View {
    @State var screenshotMaker: ScreenshotUIView?
    
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
                if let screenshotMaker = screenshotMaker {
                    screenshotMaker.screenshot()?.saveToDocuments()
                }
                else {
                    snapshot().saveToDocuments()
                }
            } label: {
                Text("Take screenshot ContainerView")
            }
        }
        .screenshotView { screenshotMaker in
            self.screenshotMaker = screenshotMaker
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
