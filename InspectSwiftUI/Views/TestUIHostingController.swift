//
//  TestView.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 26/01/22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Text("Text...")
            .background(.blue)
        HostViewContainer()
    }
}

struct ViewText: View {
    var body: some View {
        VStack {
            Text("Text...")
                .background(.blue)
        }
    }
}

class HostViewContainerModel: ObservableObject {
    @Published var size: CGSize = .zero
}

struct HostViewContainer: View {
    @ObservedObject var model = HostViewContainerModel()
    
    var body: some View {
        HostView(model: model) {
            VStack {
                Text("Write whathever you want")
                Text("It still works")
            }
        }
            .frame(width: model.size.width, height: model.size.height)
    }
}

struct HostView<Content: View>: UIViewControllerRepresentable {
    let model: HostViewContainerModel
    let content: Content
    
    init(model: HostViewContainerModel, _ content: @escaping () -> Content) {
        self.model = model
        self.content = content()
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let text = Text("Text in UIViewControllerRepresentable")
        let controller = UIHostingController(rootView: self.content)
        controller.view.backgroundColor = .orange
        let size = controller.view.intrinsicContentSize
        controller.view.frame = CGRect(origin: .zero, size: size)
        model.size = size
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        print(uiViewController.view)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
