
import Foundation

typealias Rooms = [Room]

struct Room: Decodable {
    let name: String?
    let spots: Int?
    let thumbnail: String?
    var imgData: Data?
}

struct Root: Decodable {
    let rooms: Rooms?
    
    private enum CollectionCodingKeys: String, CodingKey {
        case rooms
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CollectionCodingKeys.self)
        rooms = try container.decode(Rooms.self, forKey: .rooms)
    }
}
