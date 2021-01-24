import WatchConnectivity

class iOSConnection: NSObject, WCSessionDelegate, ObservableObject {
    
    let session: WCSession
    @Published var temperature : String = "0"
    @Published var newTemp : String = "0"
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        self.connect()
    }
    
    func send(message: [String:Any]) -> Void {
        session.sendMessage(message, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
        print("Sent: ", message)
    }
    
    func connect() {
        guard WCSession.isSupported() else {
            print("WCSession is not supported")
            return
        }
        
        session.activate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
            DispatchQueue.main.async {
                print("message", message)
                self.temperature = message["temperature"] as? String ?? "0"
                self.newTemp = message["newTemp"] as? String ?? "0"
                print("Temp", self.temperature)
            }
        }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // code
        print(error)
    }
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        // code
    }
    #endif
    
    #if os(iOS)
    func sessionDidDeactivate(_ session: WCSession) {
        // code
    }
    #endif
}
