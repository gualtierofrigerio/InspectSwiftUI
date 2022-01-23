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
                NavigationLink(destination: ContainerView()) {
                    Text("Show container view")
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
