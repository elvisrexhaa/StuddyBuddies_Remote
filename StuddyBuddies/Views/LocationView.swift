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

    var body: some View {
        
        VStack {
            if let location = locationManager.location {
                Text("Your location: \(location.latitude), \(location.longitude)")
            }

            LocationButton(.currentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .frame(width: 300, height: 50)
            .foregroundColor(.white)
        }
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
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
