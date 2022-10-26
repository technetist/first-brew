//
//  DrinkDetail.swift
//  First Brew
//
//  Created by Adrien Maranville on 8/1/20.
//  Copyright © 2020 Adrien Maranville. All rights reserved.
//

import SwiftUI

struct DrinkDetail: View {
    @State private var showingAlert = false
    var drink: Drink
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack(alignment: .bottom) {
                Image(drink.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .frame(height: 68)
                    .foregroundColor(.black)
                    .opacity(0.35)
                    .blur(radius: 10)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(drink.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    } // End of ZStack
                        .padding(.leading)
                        .padding(.bottom)
                    Spacer()
                } // End of HStack
            } // End of ZStack
                .listRowInsets(EdgeInsets())
            Text(drink.description)
                .foregroundColor(.primary)
                .font(.body)
                .lineLimit(5)
                .padding()
            
            HStack {
                Spacer()
                OrderButton(showingAlert: $showingAlert, drink: self.drink)
                Spacer()
            }
            .padding(.top, 50)
        } // End of ScrollView
            .edgesIgnoringSafeArea(.top)
//            .navigationBarHidden(true)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Added \(drink.name) to Cart!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: drinkData.first!)
    }
}

struct OrderButton: View {
    @ObservedObject var basketListener = BasketListener()
    @Binding var showingAlert: Bool
    var drink: Drink
    var body: some View {
        Button(action: {
            self.showingAlert.toggle()
            self.addItemToBasket()
        }) { Text("Add to Cart") }
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .font(.headline)
            .background(Color.blue)
            .cornerRadius(10)
    }
    
    private func addItemToBasket() {
        var orderBasket: OrderBasket!
        
        if self.basketListener.orderBasket != nil {
            orderBasket = self.basketListener.orderBasket
        } else {
            orderBasket = OrderBasket()
            orderBasket.ownerId = "123"
            orderBasket.id = UUID().uuidString
        }
        
        orderBasket.add(self.drink)
        orderBasket.saveBasketToFirestore()
    }
}
