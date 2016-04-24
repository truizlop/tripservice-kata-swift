//
//  User.swift
//  TripService-Kata
//
//  Created by Tomás Ruiz López on 24/4/16.
//  Copyright © 2016 Tomás Ruiz López. All rights reserved.
//

import Foundation

class User {
    var friends : [User] = []
    var trips : [Trip] = []
    
    func addFriend(friend : User){
        friends.append(friend)
    }
    
    func addTrip(trip : Trip){
        trips.append(trip)
    }
}

extension User : Equatable {}

func ==(lhs : User, rhs : User) -> Bool {
    return lhs === rhs
}