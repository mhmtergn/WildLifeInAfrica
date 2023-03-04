//
//  CoverImageView.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-02-26.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: - PROPERTIES
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - BODY
    var body: some View {
        
        TabView {
            ForEach(coverImages) { item in
                
                Image(item.name)
                    .resizable()
                .scaledToFill()
                
            }// - Loop
            
        }// --- TABVIEW
        .tabViewStyle(PageTabViewStyle())
    }
}

    //MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
