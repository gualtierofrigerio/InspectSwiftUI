//
//  FirstView.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 20/01/22.
//

import SwiftUI

struct FirstView: View {
    @StateObject var sharedModel = SharedModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Counter = \(sharedModel.counter)")
                    .inspectView { inspectorView in
                        print("inspectorView \(inspectorView)")
                    }
                Button {
                    sharedModel.counter += 1
                } label: {
                    Text("Increment counter")
                }
                NavigationLink(destination: SecondView()) {
                    Text("Show second view")
                }
                NavigationLink(destination: ToggleView()) {
                    Text("Show view with toggle")
                }
                NavigationLink(destination: ViewContainingToggle()) {
                    Text("Show view containing ToogleView")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(sharedModel)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
