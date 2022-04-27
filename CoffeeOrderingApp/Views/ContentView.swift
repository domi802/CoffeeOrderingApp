//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Dominik Woźniak on 12/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject  private var orderListVM = OrderListViewModel()
    
    @State private var showModal: Bool = false
    var body: some View {
        
        NavigationView{
            
            OrderListView(orders:
                            self.orderListVM.orders)
            .navigationBarTitle("Coffee Orders")
            .navigationBarItems(leading: Button(action: reloadOrders) {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(Color.black)
            }, trailing: Button(action: showAddCoffeeOrderView){
                Image(systemName: "plus")
                    .foregroundColor(Color.black)
            })
            
            .sheet(isPresented: self.$showModal){
                AddCoffeeOrderView(isPresented: self.$showModal)
            }
        }
    }
    
    private func reloadOrders(){
        
        self.orderListVM.fetchOrders()
    }


    private func showAddCoffeeOrderView() {
        self.showModal = true
    }

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
