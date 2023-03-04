//
//  HeadingView.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-03-01.
//

import SwiftUI

struct HeadingView: View {
    
    //MARK: - PROPERTIES
    
    var headingImage: String
    var headingText: String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.horizontal)
    }
}

struct HeadingView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Picture")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
