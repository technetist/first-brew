//
//  HomeView.swift
//  First Brew
//
//  Created by Adrien Maranville on 7/24/20.
//  Copyright © 2020 Adrien Maranville. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Test Text")
                .navigationBarTitle(Text("First Brew"))
                .navigationBarItems(leading:
                    Button(action: {
                        print("log out")
                        createMenu()
                    }, label: {
                        Text("Log Out")
                    }), trailing:
                    Button(action: {
                        print("cart")
                    }, label: {
                        Image("basket")
                    })
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
