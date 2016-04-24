//
//  UserTest.swift
//  TripService-Kata
//
//  Created by Tomás Ruiz López on 24/4/16.
//  Copyright © 2016 Tomás Ruiz López. All rights reserved.
//

import Quick
import Nimble

class UserTest : QuickSpec {
    
    override func spec() {
        describe("User"){
            let JOHN = User()
            let MARY = User()
            
            it("should return false if users are not friends"){
                let anyUser = aUser().withFriends(JOHN).build()
                
                expect(anyUser.isFriendWith(MARY)) == false
            }
            
            it("should return true if users are friends"){
                let anyUser = aUser().withFriends(JOHN, MARY).build()
                
                expect(anyUser.isFriendWith(MARY)) == true
            }
        }
    }
    
}