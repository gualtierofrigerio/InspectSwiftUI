//
//  ContainerView.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 23/01/22.
//

import SwiftUI

struct ContainerView: View {
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
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
