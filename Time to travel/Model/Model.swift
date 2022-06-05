//
//  JSONModel.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 03.06.2022.
//

import Foundation


public struct Flight: Codable {
    
    var startCity: String
    var endCity: String
    
    var startCityCode: String
    var endCityCode: String
    
    var startDate: String
    var endDate: String
    
    var price: Int
    var searchToken: String
    
    var isLiked: Bool = false
    
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    func sortFlightsArrayByPrice () {
        flightsArray.sort(by: { $0.price < $1.price } )
    }
    
    func sortFlightsArrayByData () {
        flightsArray.sort(by: { $0.startDate < $1.startDate } )
    }
    
    var flightsArray = [Flight]()
    
    func fetchData() {
        
        do {
            if let file = URL(string: "https://travel.wildberries.ru/statistics/v1/cheap") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    print(type(of: object))
                    
                    for value in object.values {
                        if let object = value as? [Any] {
                            for anItem in object as! [Dictionary<String, AnyObject>] {
                                
                                let startCity = anItem["startCity"] as! String
                                let endCity = anItem["endCity"] as! String
                                let startCityCode = anItem["startCityCode"] as! String
                                let endCityCode = anItem["endCityCode"] as! String
                                let startDate = anItem["startDate"] as! String
                                let endDate = anItem["endDate"] as! String
                                let price = anItem["price"] as! Int
                                let searchToken = anItem["searchToken"] as! String
                                
                                flightsArray.append(Flight(
                                    startCity: startCity,
                                    endCity: endCity,
                                    startCityCode: startCityCode,
                                    endCityCode: endCityCode,
                                    startDate: startDate,
                                    endDate: endDate,
                                    price: price,
                                    searchToken: searchToken
                                ))
                            }
                        }
                    }
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
