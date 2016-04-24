//
//  UserBuilder.swift
//  TripService-Kata
//
//  Created by Tomás Ruiz López on 24/4/16.
//  Copyright © 2016 Tomás Ruiz López. All rights reserved.
//

import Foundation

class UserBuilder {
    private var friends : [User]! = nil
    private var trips : [Trip]! = nil
    
    func withFriends(friends : User...) -> UserBuilder {
        self.friends = friends
        return self
    }
    
    func withTrips(trips : Trip...) -> UserBuilder {
        self.trips = trips
        return self
    }
    
    func build() -> User {
        let user = User()
        
        friends.forEach{ user.addFriend($0) }
        trips.forEach{ user.addTrip($0) }
        
        return user
    }
}

func aUser() -> UserBuilder{
    return UserBuilder()
}