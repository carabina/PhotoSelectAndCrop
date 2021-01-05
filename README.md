Photo Select and Crop
=====================

<img align="right" src="https://github.com/gymsymbol/PhotoSelectAndCrop/blob/main/Screenshots/screenViews.png" width="65%">

This repository shows one way to integrate a UIImagePickerController into a SwiftUI app. It is meant to be similar to the stock Contcacts app where a user can select, scale and position an image to be cropped and saved as a conatct's photo. The example uses a `processImage()` function to send four items via bindings to the parent view:

1) a copy of the original `UIImage`,
2) a scaled and / or cropped `UIImage` version of it,
3) a `CGFloat`, and 
4) a `CGPoint`. 

The `CGFloat` and `CGPoint` represent the scale and position of the original image used to make the processed version. 

> :point_up: By saving the original image and scale and position markers and passing them to the `ImageMoveAndScaleSheet` view, if the user taps the "Change photo" button, the original photo is scaled and positioned to allow subsequent adjustments.

Works in both portrait and landscape modes



