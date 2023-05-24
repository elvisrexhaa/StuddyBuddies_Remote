//
//  LocationView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 21/05/2023.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
import ProgressHUD

struct LocationView: View {
    
    @StateObject var locationManager = LocationManager()
    
    @Binding var lat: Float
    @Binding var long: Float
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                
                
                Image(systemName: "location.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                
                if lat != 0.0, long != 0.0 {
                    Text ("\(lat), \(long)")
                }
                
                
                
                LocationButton (.currentLocation) {
                    locationManager.requestLocation()
                }
                .symbolVariant (.fill)
                .labelStyle (.titleAndIcon)
                .foregroundColor (Color.white)
                .cornerRadius (10)
                .font(.system(size: 12))
                
            }
            
            
            
            Divider()
                .frame(width: 400, height: 3)
                .foregroundColor(.black)
                .background(.white)
        }
        .onChange(of: locationManager.location) { newValue in
            if let lat = newValue?.latitude, let long = newValue?.longitude {
                self.lat = Float(lat)
                self.long = Float(long)
            }
            
        }
        
    }
    
}



struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(lat: .constant(0.0), long: .constant(0.0))
    }
}


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        // show progress bar
        ProgressHUD.show()
        manager.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // hide progress bar
        ProgressHUD.dismiss()
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // hide progress bar
        ProgressHUD.dismiss()
        print("did fail with error: \(error.localizedDescription)")
        
    }
}
