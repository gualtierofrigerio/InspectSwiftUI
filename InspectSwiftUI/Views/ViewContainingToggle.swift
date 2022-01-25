//
//  ViewContainingToggle.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 21/01/22.
//

import SwiftUI

struct ViewContainingToggle: View {
    @State var screenshotMaker: ScreenshotMaker?
    
    var body: some View {
        VStack {
            Text("ToggleView inside orange border")
            ToggleView()
                .border(.orange, width: 2.0)
            Button {
                if let screenshotMaker = screenshotMaker {
                    screenshotMaker.screenshot()?.saveToDocuments()
                }
                else {
                    snapshot().saveToDocuments()
                }
            } label: {
                Text("Take screenshot ViewContainingToggle")
            }
        }
        .screenshotView { screenshotMaker in
            self.screenshotMaker = screenshotMaker
        }
    }
}

struct ViewContainingToggle_Previews: PreviewProvider {
    static var previews: some View {
        ViewContainingToggle()
    }
}
