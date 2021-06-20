
import XCTest
@testable import RoomBooking

class RoomModelTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testDecoder() throws {
        let bundle = Bundle(for: type(of: self))
        guard let filePath = bundle.path(forResource: "rooms", ofType: "json")
        else {
            XCTAssertThrowsError("test file's location || name || type might be wrong")
            return
        }
        
        let data = try String(contentsOfFile: filePath).data(using: .utf8)!
        let result = try JSONDecoder().decode(Root.self, from: data)
        XCTAssertEqual(result.rooms?.count, 8)
        
        let room = result.rooms?.last
        XCTAssertEqual(room!.name, "Mina")
        XCTAssertEqual(room?.spots, 39)
    }
}
