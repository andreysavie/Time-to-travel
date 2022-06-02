//
//  Model.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 31.05.2022.
//

import Foundation

public struct Flight { // возможно сделать классом
    
    var departureCity: String
    var departureAirport: String
    
    var arrivalCity: String
    var arrivalAirport: String
    
    var departureDate: Date
    var returnDate: Date
    
    var price: Int
    var isLiked: Bool
    
}

public var flightsArray: [Flight] = [

    Flight(
        departureCity: "Краснодар",
        departureAirport: "KRD",
        arrivalCity: "Геленджик",
        arrivalAirport: "GLE",
        departureDate: Date(timeIntervalSinceNow: 1123111223234),
        returnDate: Date(timeIntervalSinceNow: 1342312315),
        price: 3435,
        isLiked: false
    ),
    
    Flight(
        departureCity: "Санкт-Петербург",
        departureAirport: "PUL",
        arrivalCity: "Новороссийск",
        arrivalAirport: "NVR",
        departureDate: Date(timeIntervalSinceNow: 125),
        returnDate: Date(timeIntervalSinceNow: 242),
        price: 1234,
        isLiked: true
    ),
    
    Flight(
        departureCity: "Крым",
        departureAirport: "CRM",
        arrivalCity: "Курск",
        arrivalAirport: "KRK",
        departureDate: Date(timeIntervalSinceNow: 554),
        returnDate: Date(timeIntervalSinceNow: 567),
        price: 4313,
        isLiked: false
    )

]
