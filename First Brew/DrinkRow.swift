//
//  DrinkRow.swift
//  First Brew
//
//  Created by Adrien Maranville on 7/31/20.
//  Copyright © 2020 Adrien Maranville. All rights reserved.
//

import SwiftUI

struct DrinkRow: View {
    var categoryName:String
    var drinks: [Drink]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.drinks) { drink in
                        NavigationLink(destination: DrinkDetail(drink: drink)) {
                            DrinkItem(drink: drink)
                                                   .frame(width: 300)
                                                   .padding(.trailing, 30)
                        }
                    }
                }
            }
        }
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        DrinkRow(categoryName: "HOT DRINKS", drinks: drinkData)
    }
}
