//
//  PageView.swift
//  Landmarks
//
//  Created by user on 21.03.2021.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }//$ - привязкa к значению, которое хранится как состояние.
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages:ModelData().features.map{FeatureCard(landmark: $0)})
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
