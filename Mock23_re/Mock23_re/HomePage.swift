//
//  HomePage.swift
//  Mock23_re
//
//  Created by Akila Gamage on 2024-12-05.
//

import SwiftUI

struct HomePage: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        NavigationStack{
            VStack(spacing:10){
                Text("Buy Fresh Groceries")
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0))
                Divider()
                List {
                    ForEach(viewModel.shopItems.indices, id: \.self) { i in
                        HStack {
                            Image("\(viewModel.shopItems[i].name.lowercased())")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            VStack(alignment: .leading) {
                                Text("\(viewModel.shopItems[i].name)")
                                Text("$\(viewModel.shopItems[i].price, specifier: "%.2f")")
                                    .bold()
                            }
                            Stepper(
                                "",
                                value: $viewModel.shopItems[i].quantity,
                                in: 0...10
                            )
                            Text("\(viewModel.shopItems[i].quantity)")
                        }
                    }
                }.listStyle(.plain)
                
                Button("Checkout"){
                    viewModel.isCheckout.toggle()
                }
                    .buttonStyle(.bordered)
                    .tint(.green)
                
            }
                .padding(30)
                .sheet(isPresented: $viewModel.isCheckout) {
                    CartPage(viewModel: viewModel, PurchasedItems: $viewModel.shopItems)
                }
        }
    }
    
}

#Preview {
    HomePage()
}
