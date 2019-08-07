//
//  ImageButton.swift
//  GitTrending
//
//  Created by Bala Vino on 17/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import SwiftUI

public enum ButtonImagePosition {
    case left
    case right
    case top
    case bottom
}

struct ImageButton : View {
    var buttonTile: String
    var imageName: String
    var isSystemImageName: Bool = true
    var imagePosition: ButtonImagePosition = .left
    var action: () -> Void

    var body: some View {
        
        switch imagePosition {
        case .left:
            return Button(action: action) {
                HStack {
                    isSystemImageName ? Image(systemName: imageName) : Image(imageName)
                    Text(buttonTile)
                }
            }

        case .right:
            return Button(action: action) {
                HStack {
                    isSystemImageName ? Image(systemName: imageName) : Image(imageName)
                    Text(buttonTile)
                }
            }

        case .top:
            return Button(action: action) {
                HStack {
                    isSystemImageName ? Image(systemName: imageName) : Image(imageName)
                    Text(buttonTile)
                }
            }

        case .bottom:
            return Button(action: action) {
                HStack {
                    isSystemImageName ? Image(systemName: imageName) : Image(imageName)
                    Text(buttonTile)
                }
            }
        
        }
    }
}
