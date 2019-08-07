//
//  GTRepositoryView.swift
//  GitTrending
//
//  Created by Bala Vino on 07/08/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import SwiftUI

struct GTRepositoryView : View {
    
    var body: some View {
        VStack {
            HStack {
                ImageButton(buttonTile: "guillermomuntaner / Burritos", imageName: "cube.box.fill") {
                    
                }
                Spacer()
            }
            
            Text("A collection of Swift Property Wrappers (formerly \"Property Delegates\")")
                .font(.subheadline)
                .color(.gray)
                .lineLimit(10)
                .lineLimit(nil)
                .lineSpacing(8)
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
            
            HStack(spacing: 10, content: {
                ImageButton(buttonTile: "Swift", imageName: "circle.fill") {
                    
                }
                
                ImageButton(buttonTile: "200", imageName: "star.fill") {
                    
                }
                
                ImageButton(buttonTile: "60", imageName: "tuningfork") {
                    
                }
                
                Spacer()
            })
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .clipShape(RoundedRectangle(cornerRadius: 5, style: .circular))
            .overlay(RoundedRectangle(cornerRadius: 5, style: .circular).stroke(Color.white, lineWidth: 0.5))
    }

}

#if DEBUG
struct GTRepositoryView_Previews : PreviewProvider {
    static var previews: some View {
        GTRepositoryView()
    }
}
#endif
