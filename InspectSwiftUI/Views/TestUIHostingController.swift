//
//  TestView.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 26/01/22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        HostViewContainer()
    }
}

class HostViewContainerModel: ObservableObject {
    @Published var size: CGSize = .zero
}

struct HostViewContainer: View {
    @ObservedObject var model = HostViewContainerModel()
    
    var body: some View {
        HostView(model: model)
            .frame(width: model.size.width, height: model.size.height)
    }
}

struct HostView: UIViewControllerRepresentable {
    let model: HostViewContainerModel
    
    init(model: HostViewContainerModel) {
        self.model = model
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let text = Text("Short text now longer")
        let controller = UIHostingController(rootView: text)
        controller.view.backgroundColor = .red
        let size = controller.view.intrinsicContentSize
        controller.view.frame = CGRect(origin: .zero, size: size)
        model.size = size
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
