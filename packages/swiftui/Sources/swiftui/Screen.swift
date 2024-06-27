//
//  Screen.swift
//  
//
//  Created by Aleksei Tiurnin on 27.06.2024.
//

import SwiftUI
import PhotoPicker

protocol ViewModelP: ObservableObject {
    var imageData: Data? { get set }
}

class ViewModel: ObservableObject, ViewModelP {
    @Published var imageData: Data?
}

struct ContentView<VM: ViewModelP>: View {
    
    @ObservedObject var viewModel: VM
    @State var isPhotoPickerShowed: Bool = false
    
    var body: some View {
        VStack {
            if let imageData = viewModel.imageData,
               let uiimage = UIImage(data: imageData) {
                Image(uiImage: uiimage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 200)
                    .onTapGesture {
                        viewModel.imageData = nil
                    }
            } else {
                Text("Choose Photo")
                    .onTapGesture {
                        isPhotoPickerShowed.toggle()
                    }
            }
            Text("Hello, world!")
            Text("\(Date())")
        }
        .padding()
        .sheet(isPresented: $isPhotoPickerShowed) {
            PhotoPicker(imageData: $viewModel.imageData)
        }
    }
}

#Preview {
    ContentView<ViewModel>(viewModel: .init())
}
