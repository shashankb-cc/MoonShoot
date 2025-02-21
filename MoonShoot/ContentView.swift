//
//  ContentView.swift
//  MoonShoot
//
//  Created by Shashank B on 14/02/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts:[String:Astronaut] = Bundle.main.decode("astronauts")
    let missions:[Mission] = Bundle.main.decode("missions")
    
    @State private var showingGrid = true
    @State private var pathStore = PathStore()

    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink(value:mission) {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)

                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                            .padding()
                            
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button {
                        showingGrid.toggle()
                    } label: {
                        Image(systemName: showingGrid ? "list.bullet" : "square.grid.2x2")
                            .foregroundStyle(.white)
                    }
                })
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
