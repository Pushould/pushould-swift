import Foundation
import SocketIOClientSwift

public final class Pushould: NSObject {
    public var socket: SocketIOClient;

    public init(url: String, client_token: String) {
        self.socket = SocketIOClient(socketURL: NSURL(string: url)!, options: [.ConnectParams(["query": "client_token=\(client_token)"])])
        self.socket.connect()
        super.init()
    }

    public func subscribe(room: String) -> Pushould {
        self.socket.on("connect") { (data, ack) in
            self.socket.emit("subscribe", ["room": room])
        }
        return self
    }

    public func bind(event: String, function: NormalCallback) {
        self.socket.on(event, callback: function)
    }
}