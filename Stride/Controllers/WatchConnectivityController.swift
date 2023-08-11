//
//  WatchConnectivityController.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 09/08/23.
//

import Foundation
import WatchConnectivity

class WatchProvider: NSObject, WCSessionDelegate, ObservableObject{
    
    var session: WCSession
    @Published var globalVariabel: GlobalVariabels
    @Published var globalVariabels: String
    
    init(session: WCSession = .default) {
        self.session = session
        self.globalVariabel = GlobalVariabels()
        self.globalVariabels = "haha"
        super.init()
        self.session.delegate = self
        
#if os(iOS)
        print("Connection provider initialized on phone")
#endif
#if os(watchOS)
        print("Connection provider initialized on watch")
#endif
        self.session.activate()
        self.connect()
    }
    
    func connect(){
        guard WCSession.isSupported() else {
            print("WCSession is not supported")
            return
        }
        
        session.activate()
    }
    
    func send(variabel: [String:Any]) -> Void {
        print("masuk send \(variabel)")
        session.sendMessage(variabel, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
        print("\(variabel.values)")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("WC session failed with error: \(error.localizedDescription)")
        }
        
        if WCSession.default.isReachable {
            print("Reachable")
        } else {
            print("Not Reachable")
        }
    }
#if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("oke")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("oke")
    }
#endif
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
//        print(message["coba"] ?? "yolo")
        print("masuk receive")
        DispatchQueue.main.async {
            self.globalVariabels = message["message"] as? String ?? "Yolo"
        }
    }
    
}
