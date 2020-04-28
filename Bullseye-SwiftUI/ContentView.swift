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
    
    // Game stats @State var score = 0
    @State var score = 0
    @State var round = 1
    
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
                Alert(title: Text(alertTitle()),
                      message: Text(alertMessage()),
                      dismissButton: .default(Text("Awesome!")) {
                        self.newRound()
                    })
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
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("\(round)")
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
        let maximumScore = 100
        let difference = abs(target - currentSliderValue)
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return maximumScore - difference + bonus
    }
    
    func alertMessage() -> String {
        return "The slider's value is \(currentSliderValue).\n"
            + "The target value is \(target).\n"
            + "You scored \(pointsForCurrentRound()) points this round."
    }
    
    func alertTitle() -> String {
        let difference: Int = abs(currentSliderValue - target)
        let title: String
        
        switch difference {
        case 0:
            title = "Perfect!"
        case 1:
            title = "You almost had it!"
        case 2...5:
            title = "You almost had it!"
        case 6...10:
            title = "Not bad."
        default:
            title = "Are you even trying?"
        }
        
        return title
    }
    
    func newRound() {
        score += pointsForCurrentRound()
        target = Int.random(in: 1...100)
        round += 1
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
