//
//  DeviceOrientation.swift
//  PhotoSelectAndCrop
//
//  Created by Dave Kondris on 03/01/21.
//

import Combine
import UIKit

final class DeviceOrientation: ObservableObject {
    enum Orientation {
        case portrait
        case landscape
    }
    @Published var orientation: Orientation
    private var listener: AnyCancellable?
    init() {
        orientation = UIDevice.current.orientation.isLandscape ? .landscape : .portrait
        listener = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .compactMap { ($0.object as? UIDevice)?.orientation }
            .compactMap { deviceOrientation -> Orientation? in
                if deviceOrientation.isPortrait {
                    return .portrait
                } else if deviceOrientation.isLandscape {
                    return .landscape
                } else {
                    return nil
                }
            }
            .sink { [weak self] deviceOrientation in self?.orientation = deviceOrientation }
    }
}
