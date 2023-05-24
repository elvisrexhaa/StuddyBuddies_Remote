//
//  FiltersView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 23/05/2023.
//

import SwiftUI

struct FiltersView: View {
    
    @Environment(\.presentationMode) var presentationMode // for dismissing this view
    
    @State var selectedCourse = "None"
    @AppStorage("selectedRange") var selectedRange = 50.0
    
    var completion: (_ course: String, _ range: Double)->()
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Course")) {
                    Picker("Select a Course", selection: $selectedCourse) {
                        ForEach(Constants.courses, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                
                Section(header: Text("Area Range")) {
                    VStack {
                        Text("Area Range: \(Int(selectedRange))")
                        Slider(value: $selectedRange, in: 1...50, step: 1)
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Filter")
            .toolbar { TopLeftButtonView() }
            .toolbar { TopRightButtonView() }
            
        }
    }
}

extension FiltersView {
    
    private func TopRightButtonView() -> some ToolbarContent {
        
        // button on top right
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                completion(selectedCourse, selectedRange)
                presentationMode.wrappedValue.dismiss() // dismiss the screen
            } label: {
                Text("Done")
            }
        }
        
    }
    
    private func TopLeftButtonView() -> some ToolbarContent {
        
        // button on top left
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                self.presentationMode.wrappedValue.dismiss() // dismiss the screen
            } label: {
                Text("Cancel")
            }
        }
    }
    
    
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView { _, _ in }
    }
}




struct CustomView: View {
    
    @Environment(\.dismiss) var dismiss // for dismissing this view
    
    @State private var isOnAppearCalled = false  // for calling onAppear only once
    
    var body: some View {
        
        VStack {
            
        }
        .onAppear { onAppearHandling() }
        .toolbar { TopRightButtonView() }
        
    }
    
}


extension CustomView {
    
    private func TopRightButtonView() -> some ToolbarContent {
        
        // button on top right
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                
            } label: {
                Text("Done")
            }
        }
    }
    
}


extension CustomView {
    
    private func onAppearHandling() {
        
        // for calling onAppear only once
        guard isOnAppearCalled == false else { return }
        isOnAppearCalled = true
        
        
    }
    
}


struct CustomView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomView()
        
        CustomView()
            .colorScheme(.dark)
        
    }
}
