
import SwiftUI

extension View {
    
    @ViewBuilder func isHidden(_ shouldHide: Bool, removed: Bool = false) -> some View {
        if shouldHide { EmptyView() }
        else { self }
    }
    
    @ViewBuilder func isVisible(_ shouldBeVisible: Bool, removed: Bool = false) -> some View {
        if shouldBeVisible { self }
        else { EmptyView() }
    }
    
    func defaultShadow() -> some View {
           self.shadow(
               color: .primary.opacity(0.2),
               radius: 3.0,
               x: 0,
               y: 1
           )
       }
    
}

extension Dictionary {
    
    func toString() -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8)?.removingPercentEncoding ?? ""
        } catch {
            printOnDebug("Error serializing dictionary to JSON string: \(error.localizedDescription)")
            return ""
        }
    }
    
    func print() {
        printOnDebug(self.toString())
    }
    
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


extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var keyWindowCustom: UIWindow? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return nil}
        guard let window = windowScene.windows.first else { return nil}
        return window
    }
    
}
