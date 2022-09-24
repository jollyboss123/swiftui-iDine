//
//  ContentView.swift
//  iDine
//
//  Created by Fu Sing Voon on 24/09/2022.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(menu) { section in
                        Section(
                            header: Text(section.name)
                        ) {
                            ForEach(section.items) { item in
                                NavigationLink(
                                    destination: ItemDetail(item: item)
                                ) {
                                    ItemRow(item: item)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Menu")
                .listStyle(GroupedListStyle())
            }            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
