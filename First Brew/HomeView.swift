//
//  HomeView.swift
//  First Brew
//
//  Created by Adrien Maranville on 7/24/20.
//  Copyright © 2020 Adrien Maranville. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var showingBasket = false
    @ObservedObject var drinkListener = DrinkListener()
    
    var categories: [String : [Drink]] {
        .init(
            grouping: drinkListener.drinks,
            by: {$0.category.rawValue}
        )
    }
    
    var body: some View {
        NavigationView {
            List(categories.keys.sorted(), id: \String.self) {
                key in
                
                DrinkRow(categoryName: "\(key) Drink".uppercased(), drinks: self.categories[key]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
            }
            .navigationBarTitle(Text("First Brew"))
            .navigationBarItems(leading:
                Button(action: {
                    print("log out")
                }, label: {
                    Text("Log Out")
                }), trailing:
                Button(action: {
                    self.showingBasket.toggle()
                }, label: {
                    Image("basket")
                })
                    .sheet(isPresented: $showingBasket) {
                        OrderBasketView()
                }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
