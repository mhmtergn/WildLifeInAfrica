//
//  VideoPlayerView.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-03-03.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    //MARK: - PROPERTIES
    
    var videoSelected: String
    var videoTitle: String
    
    //MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
//                Text(videoTitle)
//                    .foregroundColor(.accentColor)
            }
            .overlay(alignment: .topLeading, content: {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
            })
        } // : VStack
        
        .foregroundColor(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}


    //MARK: - PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        })
    }
}
