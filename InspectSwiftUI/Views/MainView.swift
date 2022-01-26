//
//  MainView.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 23/01/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var sharedModel = SharedModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Counter = \(sharedModel.counter)")
                Button {
                    sharedModel.counter += 1
                } label: {
                    Text("Increment counter")
                }
                Spacer()
                NavigationLink(destination: ContainerView()) {
                    Text("Show container view")
                }
                Spacer()
                NavigationLink(destination: ToggleView()) {
                    Text("Show view with toggle")
                }
                Spacer()
                NavigationLink(destination: ViewContainingToggle()) {
                    Text("Show view containing ToogleView")
                }
                Spacer()
            }
            .screenshotView { screenshotMaker in
                // take a screenshot only of the VStack without the title
                screenshotMaker.screenshot()?.saveToDocuments()
            }
            .navigationTitle("This is the title")
        }
        .screenshotView { screenshotMaker in
            // take a screenshot of the NavigationView including the title
            screenshotMaker.screenshot()?.saveToDocuments()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(sharedModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
