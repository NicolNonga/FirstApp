//
//  ContentView.swift
//  FirstApp
//
//  Created by apple on 5/23/25.
//
// implicity return when u have one line of code

import SwiftUI

struct ContentView: View {
    let  emojis:[String] = ["👻","🕷️","😈", "😈", "👻","🕷️",  "😈", "👻", "🕷️","😈",  "👻","🕷️",  "😈", "👻", "🕷️","😈"
                            , "👻","🕷️" ,"🕷️","😈",
                            "😈", "👻", "🕷️","😈",  "👻","🕷️",
    ]
    @State var cardCount: Int = 3
    var body: some View {
        
        VStack {
            ScrollView{
                cards
            }
       
            
            Spacer()
            
            cardCountAjusters

        }.padding()
        


    }
    
    var cards: some View {
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(contentMode: .fit)
                
            }
        }.foregroundColor(.orange)
            .padding()
    }
    
    
    var cardCountAjusters : some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
            
        }     .imageScale(.large)
            .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        
        Button(action:{
             cardCount += offset
        } , label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 && offset < 0 || cardCount + offset > emojis.count)
    }
    
    
    var cardRemover : some View {
        cardCountAdjuster(by: -1, symbol: "minus.circle.fill")
    }

    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "plus.circle.fill")
    }
    struct CardView: View {
        let content: String
        
       @State var isFaceUp = true
        
        var body: some View {
            ZStack {
                //we use let here because roudedRectagle dont change
                // we dont neew to tell the type of base cause swift know the type already
                let  base  = RoundedRectangle(cornerRadius: 12)
                
                 
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }.opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
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
