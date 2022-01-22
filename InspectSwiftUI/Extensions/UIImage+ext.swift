//
//  UIImage+ext.swift
//  InspectSwiftUI
//
//  Created by Gualtiero Frigerio on 22/01/22.
//

import UIKit

extension UIImage {
    func saveToFile(atURL url: URL) {
        guard let data = self.pngData() else { return }
        do {
            try data.write(to: url)
            print("Screenshot saved at path \(url.absoluteString)")
        }
        catch (let error) {
            print("Error \(error.localizedDescription)")
        }
    }
    
    func saveToDocuments() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let name = "\(Date().timeIntervalSince1970).png"
        let fileURL = paths[0].appendingPathComponent(name)
        saveToFile(atURL: fileURL)
    }
}
