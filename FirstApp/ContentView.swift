//
//  ContentView.swift
//  FirstApp
//
//  Created by apple on 5/23/25.
//


import SwiftUI

struct ContentView: View {
    let  emojis:[String] = ["👻","🕷️","😈", "😈"]
    var body: some View {
        
        HStack{
            
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                
            }
       
        }.foregroundColor(.orange)
            .padding()
    }
    struct CardView: View {
        let content: String
        
       @State var isFaceUp = true
        
        var body: some View {
            ZStack {
                //we use let here because roudedRectagle dont change
                // we dont neew to tell the type of base cause swift know the type already
                let  base  = RoundedRectangle(cornerRadius: 12)
                if isFaceUp {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
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
