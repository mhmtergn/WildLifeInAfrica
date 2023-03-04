//
//  InsetFactView.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-03-01.
//

import SwiftUI

struct InsetFactView: View {
    
    //MARK: - PROPERTIES
    
    let animal: Animal
    
    var body: some View {
        
        GroupBox {
            
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }// --- TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }// --- GroupBox
        
    }
}

struct InsetFactView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
