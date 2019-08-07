//
//  GTDeveloperListView.swift
//  GitTrending
//
//  Created by Bala Vino on 07/08/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import SwiftUI

struct GTDeveloperListView : View {
    
    var body: some View {
        List {
            ForEach(0..<6) { i in
                GTDeveloperView()
            }
        }
    }
}

#if DEBUG
struct GTDeveloperListView_Previews : PreviewProvider {
    static var previews: some View {
        GTDeveloperListView()
    }
}
#endif
