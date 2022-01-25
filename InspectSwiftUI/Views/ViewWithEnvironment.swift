//
//  ViewWithEnvironment.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 23/01/22.
//

import SwiftUI

struct ViewWithEnvironment: View {
    @EnvironmentObject var sharedModel: SharedModel
    @State var screenshotMaker: ScreenshotMaker?
    
    var body: some View {
        VStack {
            Text("Counter = \(sharedModel.counter)")
            Button {
                if let screenshotMaker = screenshotMaker {
                    screenshotMaker.screenshot()?.saveToDocuments()
                }
                else {
                    self.snapshot().saveToDocuments()
                }
            } label: {
                Text("Take screenshot inside ViewWithEnvironment")
            }
        }
        .screenshotView { screenshotMaker in
            self.screenshotMaker = screenshotMaker
        }
    }
}

struct ViewWithEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        ViewWithEnvironment()
    }
}
