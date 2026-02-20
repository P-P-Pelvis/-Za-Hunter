//
//  LocationDetailsView.swift
//  'Za Hunter
//
//  Created by Edwin Tovar on 2/19/26.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    let mapItem: MKMapItem
    var body: some View {
        let adress = mapItem.placemark.subThoroughfare! + " " +
        mapItem.placemark.thoroughfare! + "\n " +
        mapItem.placemark.locality! + ", " +
        mapItem.placemark.administrativeArea! + " " +
        mapItem.placemark.postalCode!
        
       VStack {
           Text(mapItem.placemark.name!).font(.title).bold()
           Text(adress).padding()
           Text(mapItem.phoneNumber!).padding()
           if let url = mapItem.url {
               Link("Visit Website", destination: url).padding()
           }
           Button(action: {
               let latitude = mapItem.placemark.coordinate.latitude
               let longtitude = mapItem.placemark.coordinate.longitude
               let url = URL(string: "http://maps.apple.com/?q=\(latitude),\(longtitude)")!
               if UIApplication.shared.canOpenURL(url) {
                   UIApplication.shared.open(url)
               }
           }, label: {
               Text("Get Directions")
           })
           Spacer()
        }
    }
}

#Preview {
    LocationDetailsView(mapItem: MKMapItem())
}
