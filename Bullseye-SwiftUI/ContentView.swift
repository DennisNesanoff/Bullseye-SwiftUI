//
//  ContentView.swift
//  Bullseye-SwiftUI
//
//  Created by Dennis Nesanoff on 28.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties

    // User interface views
    @State var alertIsVisible = false
    
    // User interface content and layout
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                Slider(value: .constant(50), in: 0...100)
                Text("100")
            }
            Spacer()
            
            // Button row
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }.alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text("Hello there!"),
                      message: Text("This is my first pop-up."),
                      dismissButton: .default(Text("Dismiss")))
            }
            Spacer()
            
            // Score row
            HStack {
                Button(action: {
                    
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            // MARK: - Methods
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
