
import XCTest
@testable import RoomBooking

class RequestTest: XCTestCase {
    
    func testRoomsRequest() {
        let roomsRequest = Request(path: .rooms).constructURLRequest()
        let bookingRequest = Request(path: .bookRoom).constructURLRequest()
        
        let roomsURLString = "https://wetransfer.github.io/rooms.json"
        let bookingURLString = "https://wetransfer.github.io/bookRoom.json"
        
        XCTAssertEqual(roomsRequest?.url?.absoluteString, roomsURLString)
        XCTAssertEqual(bookingRequest?.url?.absoluteString, bookingURLString)
    }
}
