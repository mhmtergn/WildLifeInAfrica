//
//  MapView.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-02-26.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParksLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        
        // Basic Map
        
//        Map(coordinateRegion: $region)
        
        // Map with annotation
        
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // PIN: Old Style(Always Static)
//            MapPin(coordinate: item.location, tint: .accentColor)
            
            // New Style(Always Static)
            
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            // Custom Basic Annotation(it could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32)
//            }
            
            // Complex Map Annotation
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
            
        } // : Map
        
        .overlay(alignment: .top, content: {
            HStack(alignment: .center,spacing: 12, content: {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    
                    HStack {
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }

                    Divider()
                    
                    HStack {
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                
                
                
            }) // : HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(alignment: .topLeading, content: {
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            })
            .padding()
        })
        
        
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
