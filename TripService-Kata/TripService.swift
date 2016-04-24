//
//  TripService.swift
//  TripService-Kata
//
//  Created by Tomás Ruiz López on 24/4/16.
//  Copyright © 2016 Tomás Ruiz López. All rights reserved.
//

import Foundation

class TripService {
    
    func getTripsByUser(user : User) throws -> [Trip] {
        var tripList : [Trip] = []
        let loggedUser = try! getLoggedUser()
        var isFriend = false
        
        if loggedUser != nil {
            isFriend = user.isFriendWith(loggedUser!)
            if isFriend {
                tripList = try! getTrips(user)
            }
            return tripList
        }else{
            throw TripServiceError.UserNotLoggedIn
        }
    }
    
    func getLoggedUser() throws -> User? {
        return try! UserSession.sharedInstance.getLoggedUser()
    }
    
    func getTrips(user : User) throws -> [Trip] {
        return try! TripDAO.findTripsByUser(user)
    }
}