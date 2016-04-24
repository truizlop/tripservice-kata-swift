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
        let loggedUser = try! UserSession.sharedInstance.getLoggedUser()
        var isFriend = false
        
        if loggedUser != nil {
            for friend in user.friends {
                if friend == loggedUser {
                    isFriend = true
                    break
                }
            }
            if isFriend {
                tripList = try! TripDAO.findTripsByUser(user)
            }
            return tripList
        }else{
            throw TripServiceError.UserNotLoggedIn
        }
    }
}