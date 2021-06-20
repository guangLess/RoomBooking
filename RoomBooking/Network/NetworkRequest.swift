
import Foundation

struct RootAPI {
    static let host = "wetransfer.github.io"
}

enum APIPath: String {
    case bookRoom
    case rooms
}

struct Request {
    private let host = RootAPI.host
    private let scheme: String
    private let path: String
    
    lazy var url: URL? = nil
    
    init(path: APIPath, scheme: String = "https") {
        
        self.path = path.rawValue
        self.scheme = scheme
        self.url = constructURL()
    }
    
    private func constructURL() -> URL? {
        
        var comp = URLComponents()
        comp.scheme = scheme
        comp.host = host
        comp.path = "/" + path + ".json"
        
        return comp.url
    }
    
    func constructURLRequest() -> URLRequest? {
        
        guard let url = constructURL() else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
}
