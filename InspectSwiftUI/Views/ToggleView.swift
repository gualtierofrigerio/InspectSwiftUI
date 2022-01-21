//
//  ToggleView.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 21/01/22.
//

import SwiftUI

struct ToggleView: View {
    @State var darkBackground = false
    @State var image: UIImage?
    
    var body: some View {
        VStack {
            Toggle(isOn: $darkBackground) {
                Text("Switch to dark")
            }
            .background(darkBackground ? Color.black : Color.white)
            Button {
                image = snapshot()
            } label: {
                Text("Take screenshot")
            }
            if let image = image {
                Image(uiImage: image)
            }
        }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
