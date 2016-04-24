//
//  TripService.swift
//  TripService-Kata
//
//  Created by Tomás Ruiz López on 24/4/16.
//  Copyright © 2016 Tomás Ruiz López. All rights reserved.
//

import Foundation

class TripService {
    
    func getTripsByUser(user : User, loggedUser : User?) throws -> [Trip] {
        guard let loggedUser = loggedUser
        else{ throw TripServiceError.UserNotLoggedIn }
        
        var tripList : [Trip] = []
        
        if user.isFriendWith(loggedUser) {
            tripList = try! getTrips(user)
        }
        return tripList
        
    }
    
    func getTrips(user : User) throws -> [Trip] {
        return try! TripDAO.findTripsByUser(user)
    }
}