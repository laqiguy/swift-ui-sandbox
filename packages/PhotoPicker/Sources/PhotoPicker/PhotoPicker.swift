//
//  PhotoPicker.swift
//  genai-video
//
//  Created by Aleksei Tiurnin on 31.05.2024.
//

import SwiftUI

public struct PhotoPicker: UIViewControllerRepresentable {

    @Environment(\.presentationMode)
    private var presentationMode

    public var imageData: Binding<Data?>

    public init(imageData: Binding<Data?>) {
        self.imageData = imageData
    }
    
    public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @Binding private var presentationMode: PresentationMode
        @Binding private var imageData: Data?

        init(presentationMode: Binding<PresentationMode>, imageData: Binding<Data?>) {
            _presentationMode = presentationMode
            _imageData = imageData
        }

        public func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            defer {
                presentationMode.dismiss()
            }
            guard let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
                  let imageData = uiImage.pngData() else {
                return
            }
            self.imageData = imageData
        }

        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }

    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, imageData: imageData)
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    public func updateUIViewController(_ uiViewController: UIViewController,
                                context: UIViewControllerRepresentableContext<PhotoPicker>) {

    }
}
