//
//  PhotoPickerCoordinator.swift
//  
//
//  Created by Aleksei Tiurnin on 28.06.2024.
//

import SwiftUI

final class PhotoPickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @Binding private var isPresented: Bool
    @Binding private var imageData: Data?

    init(isPresented: Binding<Bool>, imageData: Binding<Data?>) {
        _isPresented = isPresented
        _imageData = imageData
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        defer {
            isPresented = false
        }
        guard let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
              let imageData = uiImage.pngData() else {
            return
        }
        self.imageData = imageData
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isPresented = false
    }

}
