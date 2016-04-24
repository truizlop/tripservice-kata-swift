//
//  UserSession.swift
//  TripService-Kata
//
//  Created by Tomás Ruiz López on 24/4/16.
//  Copyright © 2016 Tomás Ruiz López. All rights reserved.
//

import Foundation

class UserSession{
    static let sharedInstance = UserSession()
    
    private init(){}
    
    func getLoggedUser() throws -> User? {
        throw TripServiceError.CollaboratorCalled
    }
}