
import SwiftUI
import CoreLocation

extension View {
        
}

extension Encodable {
    
    func toDictionary() -> [String: Any] {
         do {
             let jsonData = try JSONEncoder().encode(self)
             let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
             return jsonObject ?? [:]
         } catch {
             print("Error converting Encodable object to dictionary: \(error.localizedDescription)")
             return [:]
         }
     }
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
