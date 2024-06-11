//
//  ContentView.swift
//  DemoAudioBookPlayer
//
//  Created by Nguyễn Mạnh Hùng on 10/6/24.
//

import SwiftUI
import SwiftData
//import Model
import AudioBookPlayer

struct ContentView: View {
    @Environment(AudioBookPlayerManager.self) var playerManager
    
    @State var selection = 0
    
    
    public var body: some View {
        TabView(selection: $selection) {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                VStack {
                    Button(action: {
                        print("Play0")
                        Task {
                            await playerManager.play(
                                Book.examples[0], player: nil, currentSpeed: 1
                            )
                        }
                    }, label: {
                        if playerManager.isFetching {
                            ProgressView()
                        } else {
                            Text("Play0")
                        }
                    })
                    .padding()
                    
//                    Button(action: {
//                        print("Play1")
//                        Task {
//                            await playerManager.play(
//                                Book.examples[1], player: nil, currentSpeed: 1
//                            )
//                        }
//                    }, label: {
//                        if playerManager.isFetching {
//                            ProgressView()
//                        } else {
//                            Text("Play1")
//                        }
//                    })
//                    .padding()
                    
                    Text("Play1")
                        .onTapGesture {
                            
                            Task {
//                                    await audioBookPlayerManager.play(libraryBook.book, displayInMode: .full)
                                await playerManager.play(
                                    Book.examples[1], player: nil, currentSpeed: 1
                                )
                            }
                        }
                }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)
            
            LibraryView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Books")
                }
                .tag(1)
            
            Color(.red)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(2)
        }
        .overlay {
            if playerManager.displayInMode != nil {
                AudioBookPlayer()
            }
        }

    }}

#Preview {
    ContentView()
}
