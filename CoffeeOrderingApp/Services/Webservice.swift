//
//  Webservice.swift
//  CoffeeOrderingApp
//
//  Created by Dominik Woźniak on 18/03/2022.
//

import Foundation

class Webservice{
    
    func createCoffeeOrder(order: Order,  completion: @escaping (CreateOrderResponse)-> ()) {
        
        guard let url = URL(string: "https://chemical-silver-railway.glitch.me/orders")else{
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            
            
            guard let data = data, error == nil else{
                
               
                return
            }
            
            _ = try?   JSONDecoder().decode(CreateOrderResponse.self, from:data)
            
        }.resume()
    }
    
    
    func getAllOrders(completion: @escaping ([Order]?) -> () ){
        
        guard let url = URL(string: "https://chemical-silver-railway.glitch.me/orders")else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                completion(nil)
                }
                return
            }
       let orders =    try?  JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
            completion(orders)
            }
        }.resume()
    }
}
