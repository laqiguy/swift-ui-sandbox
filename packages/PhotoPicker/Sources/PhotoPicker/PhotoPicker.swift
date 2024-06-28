//
//  PhotoPicker.swift
//  genai-video
//
//  Created by Aleksei Tiurnin on 31.05.2024.
//

import SwiftUI

public struct PhotoPicker: UIViewControllerRepresentable {
    
    public typealias Coordinator = NSObject & UIImagePickerControllerDelegate & UINavigationControllerDelegate
    
    private var isPresented: Binding<Bool>
    private var imageData: Binding<Data?>
    
    private let picker: UIImagePickerController
    
    public init(isPresented: Binding<Bool>, imageData: Binding<Data?>) {
        self.imageData = imageData
        self.isPresented = isPresented
        picker = UIImagePickerController()
    }
    
    public func makeCoordinator() -> Self.Coordinator {
        return PhotoPickerCoordinator(isPresented: isPresented, imageData: imageData)
    }
    
    public func makeUIViewController(
        context: UIViewControllerRepresentableContext<PhotoPicker>) -> UIViewController {
            picker.delegate = context.coordinator
            return picker
        }
    
    public func updateUIViewController(
        _ uiViewController: UIViewController,
        context: UIViewControllerRepresentableContext<PhotoPicker>) {
        }
}
