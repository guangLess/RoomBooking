
import Foundation

typealias RoomsResult = Result<Rooms?, NetworkError>

struct NetworkError: Error {
    let info: String
    public var description: String? {
        return info
    }
}

final class RoomsNetworkManager {
    
    func loadRooms(completion: @escaping (RoomsResult) -> Void) {
        
        guard let request = Request(path: .rooms).constructURLRequest() else {
            completion(.failure(.init(info: "URLComponents error")))
            return
        }
        
        var result = RoomsResult.failure(.init(info: "network call maybe skipped"))
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            switch data {
            case.some:
                let collection = try? JSONDecoder().decode(Root.self, from: data!)
                if let rooms = collection?.rooms?.trimCollection() {
                    result = .success(rooms)
                } else {
                    result = .failure(NetworkError(info: "There is no data avalible"))
                }
            case .none:
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                let error = NetworkError(info: error.debugDescription + String(describing: statusCode))
                result = .failure(error)
            }
            
            completion(result)
        }.resume()
    }
    
    func loadImage(from url: String, completion:  @escaping (Data?) -> Void) throws {
        
        guard let url = URL(string: url) else {
            throw NetworkError(info: "image url error")
        }
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        let session = URLSession(configuration: config)
        
        session.dataTask(with: url) { data, _ , _ in
            guard let data = data else { return }
            completion(data)
        }.resume()
    }
    
    func requestRoom(completion: @escaping (Bool?) -> Void)  {

        guard let request = Request(path: .bookRoom).constructURLRequest() else {
            completion(nil)
            return
        }
        // TODO: handle network call for booking rooms
    }
}
