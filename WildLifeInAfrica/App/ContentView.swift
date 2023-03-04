//
//  ContentView.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-02-26.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    

    @State private var is2x2GridViewActive: Bool = false
    @State private var is3x3GridViewActive: Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    let grid2x2Layout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    let grid3x3Layout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //MARK: - Functions
    
    
    
    //MARK: - BODY
    var body: some View {
        
        NavigationView {
            
            Group {
                if !is2x2GridViewActive && !is3x3GridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) {animal in
                            
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }// : Loop
                    }// : List
                } else if is2x2GridViewActive {
                    
                    VStack {
                        
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: grid2x2Layout,alignment: .center, spacing: 10) {
                                ForEach(animals) { animal in
                                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                        AnimalGridItemView(animal: animal)
                                    }// NavigationLink
                                }// : Loop
                            }// : Grid
                            .padding(10)
                            .animation(.easeIn)
                        }// : ScrollView
                    }// : VStack
                    
                } else if is3x3GridViewActive {
                    VStack {
                        
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: grid3x3Layout,alignment: .center, spacing: 10) {
                                ForEach(animals) { animal in
                                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                        AnimalGridItemView(animal: animal)
                                    }// : NavigationLink
                                }// : Loop
                            }// : 3x3 GridView
                        }// : ScroolView
                    }//: VStack
                }// : If else Condition
            }// : Group

            .navigationTitle("Wild life in Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // List
                        Button {
                           is2x2GridViewActive = false
                            is3x3GridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(is2x2GridViewActive || is3x3GridViewActive ? .primary : .accentColor)
                        }
                        
                        // Grid
                        
                        Button {
                            is2x2GridViewActive = true
                            is3x3GridViewActive = false
                            haptics.impactOccurred()
                            
                        } label: {
                            Image(systemName: "square.grid.2x2")
                                .foregroundColor(is2x2GridViewActive ? .accentColor : .primary)
                                .font(.title2)
                        }
                        
                        Button {
                            is3x3GridViewActive = true
                            is2x2GridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.grid.3x3")
                                .foregroundColor(is3x3GridViewActive ? .accentColor : .primary)
                                .font(.title2)
                        }



                    }// : HStack
                }// : ToolBarItem
            }// : ToolBar
        }// : NavigationView
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
