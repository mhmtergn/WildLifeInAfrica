//
//  insetMapView.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-03-01.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    //MARK: - PROPERTIES
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
        
        Map(coordinateRegion: $region)
            Map(coordinateRegion: $region)
            .overlay (
                NavigationLink(destination: MapView()) {
                    
                    HStack(alignment: .bottom, content: {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }) // --HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black.opacity(0.4)
                            .cornerRadius(12)
                    )
                    
                    } // -- NavigationLink
                
            )
            .frame(height: 256)
            .cornerRadius(12)

    }
}

struct insetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
