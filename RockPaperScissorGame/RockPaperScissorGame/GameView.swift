//
//  WelcomePage.swift
//  RockPaperScissorGame
//
//  Created by Yashwanth Raj Varadharajan on 7/3/24.
//
import SwiftUI

struct GameView: View {
    let availableOptions = ["rock", "paper", "scissor"]
    
    @State private var userScore: Int = 0  // User Score
    @State private var compScore: Int = 0 // Computer Score
    
    @State private var compSelection = "rock"
    @State private var userSelection = "rock"
    
    @State private var quizStatus = false // false states that CPU is waiting for users choise. True is when user has made a choise and is sent for comparision with the randomized compueter selection
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    private var userStatus: String {
        if compSelection == "rock" && userSelection == "paper" {
            return "userWon"
        } else if compSelection == "rock" && userSelection == "scissor" {
            return "compWon"
        } else if compSelection == "paper" && userSelection == "rock" {
            return "compWon"
        } else if compSelection == "paper" && userSelection == "scissor" {
            return "userWon"
        } else if compSelection == "scissor" && userSelection == "rock" {
            return "userWon"
        } else if compSelection == "scissor" && userSelection == "paper" {
            return "compWon"
        } else {
            return "Tied"
        }
    }
    
    @State private var numberOfQuestions = 1
    
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [.white, .cyan], startPoint: .center, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
                VStack{
                    Text("Question: \(numberOfQuestions)").font(.title).bold()
                    Text("Choice:").font(.title2).padding()
                    
                    HStack{
                        
                        Button(action: {
                            userSelection = availableOptions[0]
                            quizStatus = true
                            updateScore()
                        }) {
                            Image("rock")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 85)
                        }
                        
                        Button(action: {
                            userSelection = availableOptions[1]
                            quizStatus = true
                            updateScore()
                        }) {
                            Image("paper")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 85)
                        }
                        
                        Button(action: {
                            userSelection = availableOptions[2]
                            quizStatus = true
                            updateScore()
                        }) {
                            Image("scissor")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 85)
                        }
                        
                    }
                    
                }
                
                Spacer()
                
                VStack{
                    if quizStatus {
                        HStack{
                            Image(compSelection)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 85)
                            
                            Image(userSelection)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 85)
                        }
                    } else {
                        Text("Make Your Selection")
                    }
                }
                
                Spacer()
                
                VStack{
                    Button("Next") {
                        if quizStatus {
                            compSelection = availableOptions.randomElement() ?? "rock"
                            quizStatus = false
                            nextQuestion()
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                
                Spacer()
                
                VStack{
                    if quizStatus {
                        if userStatus == "userWon" {
                            Text("You Won!!")
                        } else if userStatus == "compWon" {
                            Text("You Lose!!")
                        } else {
                            Text("Tied!!")
                        }
                    }
                }
                
                Spacer()
                
                HStack{
                    VStack{
                        Text("Player Score")
                            .font(.title2)
                        Text("\(userScore)")
                            .font(.title.bold())
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack{
                        Text("Computer Score")
                            .font(.title2)
                        Text("\(compScore)")
                            .font(.title.bold())
                    }
                    .padding()
                    
                }.padding()
                
                Spacer()
                
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Game Over"),
                message: Text(alertMessage),
                dismissButton: .default(Text("Restart")) {
                    resetGame()
                }
            )
        }
    }
    
    func updateScore() {
        if userStatus == "userWon" {
            userScore += 1
        } else if userStatus == "compWon" {
            compScore += 1
        }
    }
    
    func nextQuestion(){
        numberOfQuestions += 1
        
        if numberOfQuestions > 10 {
            showAlert = true
            if userScore > compScore {
                alertMessage = "You won the game!"
            } else if compScore > userScore {
                alertMessage = "You lost the game!"
            } else {
                alertMessage = "The game is tied!"
            }
        }
    }
    
    func resetGame() {
        userScore = 0
        compScore = 0
        numberOfQuestions = 1
    }
}

#Preview {
    GameView()
}
