//
//  AnimalDetailView.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-03-01.
//

import SwiftUI
import Foundation

struct AnimalDetailView: View {
    
    //MARK: - PROPERTIES
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center,spacing: 20) {
                
                // Hero Image
                
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // Title
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y:24)
                    )
                
                // Headline
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // Gallery
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // Facts
                
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // Description
                
                Group {
                    
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")

//                        MyTextView(text: animal.description)
//
//    //                        .font(.body)
//                            .fontWeight(.medium)
//                            .font(.title)
//                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
//                            .clipped()
                        
                        Text(animal.description)
                            .font(.body)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                            .layoutPriority(1)

//                    .padding(.all, 20)
                }
                .padding(.horizontal)
                
                // Map
                
                Group {
                    
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                    
                }
                .padding(.horizontal)
                
                // Links
                
                Group {
                    
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                    
                }
                .padding(.horizontal)
                
            }// ---VSTACK
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 11")
        
        
    }
}

struct MyTextView: UIViewRepresentable {
    
    var text: String
    
    func makeUIView(context: Context) -> some UITextView {
        let textView = UITextView()
        textView.textAlignment = .justified
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        
        
        return textView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.text = text
    }
    
    
}
