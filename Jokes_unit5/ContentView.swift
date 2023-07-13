//
//  ContentView.swift
//  Jokes_unit5
//
//  Created by Moez Rehman on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    
    //var fruits = ["apple", "orange", "kiwi"]
    
    var jokes = [Joke(setup: "Why couldn't the bicycle stand up?",
                      punchline: "It was two tired!"),
                 Joke(setup: "Why did the chicken cross the road?",
                      punchline: "To get to the other side!"),
                 Joke(setup: "Is this pool safe for diving?",
                      punchline: "It deep ends"),
                 Joke(setup: "Did you hear about the cheese factory that exploded in France?",
                      punchline: "There was nothing left but de Brie"),
                 Joke(setup: "Dad, can you put my shoes on?",
                      punchline: "I don’t think they'll fit me")]
    
    @State private var showPunchline = false
    @State private var currentJokeIndex = 0
    @State private var isFeedbackPresented = false
    @State private var displaySheet = false
    @State private var isPositive = false
    
    var body: some View {
        
        ZStack {
            Color(.systemBackground)
                .onTapGesture {
                    print("Tap gesture")
                    currentJokeIndex += 1
                    showPunchline = false
                    isFeedbackPresented = true
                }
            
            VStack {
                Text(jokes[currentJokeIndex % jokes.count].setup)
                    .padding()
                
                Button {
                    print("Button tapped")
                    showPunchline = true
                    
                } label: {
                    Text("What?")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                }
                
                
                Text(jokes[currentJokeIndex % jokes.count].punchline)
                    .padding()
                    .opacity(showPunchline ? 1 : 0)
                
                Text("Tap **anywhere** to continue")
                    .padding()
                    .italic()
                    .opacity(showPunchline ? 1 : 0)
                
            }
        }
        .alert("How did you like our last joke?", isPresented: $isFeedbackPresented) {
            Button("😍") {
                print("good")
                isPositive = true
                displaySheet = true
            }
            Button("😒") {
                print("you're a terrible person")
                isPositive = false
                displaySheet = true
            }
        }
        .sheet(isPresented: $displaySheet){
            FeedbackResponseView(isPositive: isPositive)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


