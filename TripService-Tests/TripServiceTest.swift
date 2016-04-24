//
//  TripServiceTest.swift
//  TripService-Kata
//
//  Created by Tomás Ruiz López on 24/4/16.
//  Copyright © 2016 Tomás Ruiz López. All rights reserved.
//

import Quick
import Nimble

class TripServiceTest : QuickSpec {
    override func spec() {
        describe("TripService"){
            let UNUSED_USER = User()
            let GUEST : User? = nil
            let LOGGED_USER = User()
            let JOHN = User()
            let MARY = User()
            let TO_OSLO = Trip()
            let TO_MADRID = Trip()
            
            it("should throw UserNotLoggedIn error when there is no one logged"){
                let tripService = TestableTripService(loggedUser : GUEST)
                
                expect{ try tripService.getTripsByUser(UNUSED_USER) }.to(throwError(TripServiceError.UserNotLoggedIn))
            }
            
            it("should return empty list if logged user is not friends with user"){
                let tripService = TestableTripService(loggedUser : LOGGED_USER)
                let anyUser = aUser()
                    .withFriends(JOHN, MARY)
                    .withTrips(TO_OSLO, TO_MADRID).build()
                
                let trips = try! tripService.getTripsByUser(anyUser)
                
                expect(trips.count) == 0
            }
            
            it("should return trip list if logged user is friend of user"){
                let tripService = TestableTripService(loggedUser : LOGGED_USER)
                let anyUser = aUser()
                    .withFriends(JOHN, MARY, LOGGED_USER)
                    .withTrips(TO_OSLO, TO_MADRID).build()
                
                let trips = try! tripService.getTripsByUser(anyUser)
                
                expect(trips.count) == 2
            }
        }
    }
    
    class TestableTripService : TripService {
        var loggedUser : User?
        
        init(loggedUser : User?){
            self.loggedUser = loggedUser
        }
        
        override func getLoggedUser() throws -> User? {
            return self.loggedUser
        }
        
        override func getTrips(user: User) throws -> [Trip] {
            return user.trips
        }
    }
}
