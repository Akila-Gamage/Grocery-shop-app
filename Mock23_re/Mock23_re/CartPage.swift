//
//  CartPage.swift
//  Mock23_re
//
//  Created by Akila Gamage on 2024-12-05.
//

import SwiftUI

struct CartPage: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var PurchasedItems: [ShopItem]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack{
                if(viewModel.IsCartEmpty) {
                    Text("Your cart is empty")
                    Spacer()
                }
                else{
                    List {
                        Section(header: Text("Purchased Items")) {
                            ForEach(PurchasedItems){ item in
                                if(item.quantity > 0){
                                    HStack {
                                        Text("\(item.name)")
                                        Spacer()
                                        Text("\(viewModel.CalculateItemPrice(item: item), specifier: "%.2F")")
                                    }
                                }
                            }
                        }
                        Section(header: Text("Payment Details")) {
                            HStack{
                                Text("Net Amount")
                                Spacer()
                                Text("\(viewModel.Total, specifier: "%.2F")")
                            }
                           
                        }
                    }.listStyle(.plain)
                    Spacer()
                    Text("Your Previous Balance is with us: $\(viewModel.previousBalance, specifier: "%.2F")")
                        .frame(height: 80)
                        .padding()
                        .background(Color(.green))
                        .foregroundStyle(Color(.white))
                        .cornerRadius(15)
                }
            }
            .padding(25)
            .navigationTitle("My cart")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel"){
                        viewModel.previousBalance = viewModel.Total
                        viewModel.Total = 0
                        dismiss()
                    }
                }
            }
        }

            .onAppear{
                viewModel.CalculateTotalPrice(items: PurchasedItems)
            }
//            .onDisappear{
//                viewModel.previousBalance = viewModel.Total
//            }
    }
    
}

//#Preview {
//    CartPage()
//}
