//
//  ContentView.swift
//  PhotoSelectAndCrop
//
//  Created by Dave Kondris on 03/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingPhotoSelectionSheet = false

    @State private var originalImage: UIImage?
    @State private var zoom: CGFloat?
    @State private var position: CGSize?
    @State private var finalImage: UIImage?
    @State private var inputImage: UIImage?
    
    let imageWidth: CGFloat = 240

    var body: some View {
        
        VStack {
            if finalImage != nil {
                Image(uiImage: finalImage!)
                    .resizable()
                    .frame(width: imageWidth, height: imageWidth)
                    .scaledToFill()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageWidth, height: imageWidth)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.systemGray2)
            }
            Button (action: {
                self.isShowingPhotoSelectionSheet = true
            }, label: {
                Text("Change photo")
                    .foregroundColor(.systemRed)
                    .font(.footnote)
            })
        }
        .background(Color.systemBackground)
        .statusBar(hidden: isShowingPhotoSelectionSheet)
        .fullScreenCover(isPresented: $isShowingPhotoSelectionSheet, onDismiss: loadImage) {
            ImageMoveAndScaleSheet(originalImage: $originalImage, originalPosition: $position, originalZoom: $zoom, processedImage: $inputImage)
                .environmentObject(DeviceOrientation())
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        finalImage = inputImage
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
