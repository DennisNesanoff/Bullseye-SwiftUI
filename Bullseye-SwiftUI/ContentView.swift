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
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    
    var currentSliderValue: Int {
        Int(self.sliderValue.rounded())
    }
    
    // User interface content and layout
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(target)")
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            
            // Button row
            Button(action: {
                print("Points awarded: \(self.pointsForCurrentRound())")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }.alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text("Hello there!"),
                      message: Text(alertMessage()),
                      dismissButton: .default(Text("Awesome!")))
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
            .padding(.bottom, 20)
            
        }
    }
    
    // MARK: - Methods
    func pointsForCurrentRound() -> Int {
        let difference: Int
        if currentSliderValue > target {
            difference = currentSliderValue - target
        } else if target > currentSliderValue {
        difference = target - currentSliderValue } else {
        difference = 0 }
        return 100 - difference
    }
    
    func alertMessage() -> String {
        return "The slider's value is \(currentSliderValue).\n"
            + "The target value is \(target).\n"
            + "You scored \(pointsForCurrentRound()) points this round."
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
