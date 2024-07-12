//
//  ImageZoomDragView.swift
//  
//
//  Created by Aleksei Tiurnin on 28.06.2024.
//

import SwiftUI

struct ImageZoomDragView: View {
    
    struct ViewModel {
        var scale: CGFloat = 1.0
        var currentScale: CGFloat = 1.0
        var currentPosition: CGSize = .zero
        var translation: CGSize = .zero
                
        mutating func finalizeScale(_ scale: CGFloat) {
            self.scale *= scale
            currentScale = 1.0
        }
        
        mutating func finalizeTranslation(_ translation: CGSize) {
            self.translation += translation
            currentPosition = .zero
        }
    }
    
    @State private var viewModel: ViewModel = .init()

    let image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .scaleEffect(viewModel.scale * viewModel.currentScale)
            .offset(viewModel.currentPosition + viewModel.translation)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        viewModel.currentPosition = value.translation
                    }
                    .onEnded { viewModel.finalizeTranslation($0.translation) }
            )
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        viewModel.currentScale = value
                    }
                    .onEnded { viewModel.finalizeScale($0) }
            )
    }
}

#Preview {
    ImageZoomDragView(image: Image("jake", bundle: .module))
        .ignoresSafeArea()
}
