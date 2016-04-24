//
//  TripDAOTest.swift
//  TripService-Kata
//
//  Created by Tomás Ruiz López on 24/4/16.
//  Copyright © 2016 Tomás Ruiz López. All rights reserved.
//

import Quick
import Nimble

class TripDAOTest : QuickSpec {
    override func spec() {
        describe("TripDAO"){
            it("should throw CollaboratorCalled error when findTripsBy is called"){
                let tripDAO = TripDAO()
                let UNUSED_USER = User()
                
                expect{ try tripDAO.findTripsBy(UNUSED_USER) }.to(throwError(TripServiceError.CollaboratorCalled))
            }
        }
    }
}
