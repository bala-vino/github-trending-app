//
//  GTRepositoryListView.swift
//  GitTrending
//
//  Created by Bala Vino on 07/08/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import SwiftUI

struct GTRepositoryListView : View {
    
    var body: some View {
        List {
            ForEach(0..<6) { i in
                GTRepositoryView()
            }
        }
    }
}

#if DEBUG
struct GTRepositoryListView_Previews : PreviewProvider {
    static var previews: some View {
        GTRepositoryListView()
    }
}
#endif
