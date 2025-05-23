//
//  ContentView.swift
//  FirstApp
//
//  Created by apple on 5/23/25.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack{
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView()
        }.foregroundColor(.orange)
            .padding()
    }
    
    struct CardView: View {
       @State var isFaceUp = false
        
        var body: some View {
            ZStack {
                //we use let here because roudedRectagle dont change
                // we dont neew to tell the type of base cause swift know the type already
                let  base  = RoundedRectangle(cornerRadius: 12)
                if isFaceUp {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text("👻").font(.largeTitle)
                }else {
                    base.fill()
                }
            }.onTapGesture {
                //onTaGesture is just a function
                isFaceUp.toggle() // change the value
            }
        }
    }
}
#Preview {
    ContentView()
}
