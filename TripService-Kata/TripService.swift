//
//  TripService.swift
//  TripService-Kata
//
//  Created by Tomás Ruiz López on 24/4/16.
//  Copyright © 2016 Tomás Ruiz López. All rights reserved.
//

import Foundation

class TripService {
    let tripDAO : TripDAO
    
    init(tripDAO : TripDAO){
        self.tripDAO = tripDAO
    }
    
    func getTripsByUser(user : User, loggedUser : User?) throws -> [Trip] {
        guard let loggedUser = loggedUser
        else{ throw TripServiceError.UserNotLoggedIn }
        
        return user.isFriendWith(loggedUser) ?
                try! tripsBy(user) :
                noTrips()
    }
    
    private func tripsBy(user : User) throws -> [Trip] {
        return try! tripDAO.findTripsBy(user)
    }
    
    private func noTrips() -> [Trip] {
        return []
    }
}