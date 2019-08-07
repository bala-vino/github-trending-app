//
//  GTMainView.swift
//  GitTrending
//
//  Created by Bala Vino on 07/08/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import SwiftUI

struct GTMainView : View {
    
    @State var items = [TrendingType.repositories, TrendingType.developers]
    @State var currentIndex = 0
    
    var body: some View {
        
        NavigationView {
            VStack {
                SegmentedControl(selection: $currentIndex) {
                    ForEach(0..<items.count) { index in
                        Text(self.items[index].rawValue).tag(index)
                    }
                    }.padding(10)
                
                
                if self.currentIndex == 0 {
                    GTRepositoryListView()
                }
                else if currentIndex == 1 {
                    GTDeveloperListView()
                }
                }
                .navigationBarTitle(Text("Trending"))
        }
    }
}

#if DEBUG
struct GTMainView_Previews : PreviewProvider {
    static var previews: some View {
        GTMainView()
    }
}
#endif
