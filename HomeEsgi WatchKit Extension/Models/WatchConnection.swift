//
//  WatchConnection.swift
//  HomeEsgi WatchKit Extension
//
//  Created by Taj Singh on 23/01/2021.
//

import Foundation
import WatchConnectivity

class WatchConnection : NSObject,  WCSessionDelegate{
    var session: WCSession
    init(session: WCSession = .default){
        self.session = session
        session.activate()
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
}
