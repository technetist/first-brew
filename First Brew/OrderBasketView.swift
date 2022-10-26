//
//  OrderBasketView.swift
//  First Brew
//
//  Created by Adrien Maranville on 8/7/20.
//  Copyright © 2020 Adrien Maranville. All rights reserved.
//

import SwiftUI

struct OrderBasketView: View {
    @ObservedObject var basketListener = BasketListener()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(self.basketListener.orderBasket?.items ?? []) { drink in
                        HStack {
                            Text(drink.name)
                            Spacer()
                            Text("$\(drink.price.clean)")
                        } // End of HStack
                    } // End of ForEach
                        .onDelete { (indexSet) in
                            self.deleteItems(at: indexSet)
                    }
                } // End of Section
                Section {
                    NavigationLink(destination: HomeView()) {
                        Text("Place Order")
                    }
                } // End of Section
                    .disabled(self.basketListener.orderBasket?.items.isEmpty ?? true)
            } // End of List
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
        } // End of NavigationView
    }
    
    func deleteItems(at offsets: IndexSet) {
        self.basketListener.orderBasket.items.remove(at: offsets.first!)
        self.basketListener.orderBasket.saveBasketToFirestore()
    }
}

struct OrderBasketView_Previews: PreviewProvider {
    static var previews: some View {
        OrderBasketView()
    }
}
