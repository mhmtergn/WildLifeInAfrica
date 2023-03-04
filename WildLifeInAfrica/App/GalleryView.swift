//
//  GalleryView.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-02-26.
//

import SwiftUI

struct GalleryView: View {
    
    //MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var selectedAnimal: String = "lion"
    
    
    //MARK: - SIMPLE GRID
//    let gridLayout: [GridItem] = [
//
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
    
    //MARK: - EFFICIENT GRID
    
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //MARK: - DYNAMIC GRID
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
           
            
            VStack(alignment: .center, spacing: 30, content: {
               
                //MARK: - Selected Image
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                //MARK: - SLIDER
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }
                
                //MARK: - GRID
                LazyVGrid(columns: gridLayout,alignment: .center, spacing: 10, content: {
                    ForEach(animals) { item in
                        
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay {  Circle().stroke(Color.white, lineWidth: 1) }
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                        
                    } // : Loop
                })// : LazyGrid
//                .animation(.easeIn, value: nil)
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
                
            })  // : VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
