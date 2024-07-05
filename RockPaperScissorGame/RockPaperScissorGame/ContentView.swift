//
//  ContentView.swift
//  RockPaperScissorGame
//
//  Created by Yashwanth Raj Varadharajan on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            
            ZStack{
                LinearGradient(colors: [.white, .cyan], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack{
                    
                    Spacer()
                    
                    VStack{
                        Text("Welcome to")
                        Text("Rock Paper Scissor")
                            .bold()
                        Text("Game")
                    }
                    .foregroundColor(.black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
                    
                    VStack{
                        Image("titleImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: GameView()){
                        Text("Enter Game")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Spacer()
                    
                }
            }
        }.navigationTitle("Home")
        
    }
}

#Preview {
    ContentView()
}
