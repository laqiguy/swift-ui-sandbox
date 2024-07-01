//
//  ImageZoomDragView.swift
//  
//
//  Created by Aleksei Tiurnin on 28.06.2024.
//

import SwiftUI

struct ImageZoomDragView: View {
    @State private var scale: CGFloat = 1.0
    @State private var currentScale: CGFloat = 1.0
    @State private var currentPosition: CGSize = .zero
    @State private var translation: CGSize = .zero

    let image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .scaleEffect(scale * currentScale)
            .offset(currentPosition + translation)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        currentPosition = value.translation
                    }
                    .onEnded { value in
                        translation = translation + currentPosition
                        currentPosition = .zero
                    }
            )
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentScale = value
                    }
                    .onEnded { value in
                        scale *= currentScale
                        currentScale = 1.0
                    }
            )
    }
}

func +(left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width + right.width, height: left.height + right.height)
}

#Preview {
    ImageZoomDragView(image: Image("jake", bundle: .module))
        .ignoresSafeArea()
}
