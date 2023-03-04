//
//  CreditsView.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-03-04.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
     Copyright @ Mehmet Ergun
     Allright reserved
     Better Apps ❤️
     """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }//: VStack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
