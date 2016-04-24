//
//  TripDAO.swift
//  TripService-Kata
//
//  Created by Tomás Ruiz López on 24/4/16.
//  Copyright © 2016 Tomás Ruiz López. All rights reserved.
//

import Foundation

class TripDAO {
    class func findTripsByUser(user : User) throws -> [Trip] {
        throw TripServiceError.CollaboratorCalled
    }
    
    func findTripsBy(user : User) throws -> [Trip] {
        return try TripDAO.findTripsByUser(user)
    }
}