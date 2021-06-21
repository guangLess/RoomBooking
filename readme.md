
Project walkthrough, steps in order.

### 1
Started with `Models.swift` and `RoomModelTest.swift` to set the model structure. 

### 2
Build `URLRequest` instances based on `host` & `APIPath` in `NetworkRequest.swift`  with test cases.
`RoomsNetworkManager.swift`  coordinates network calls, decoding data, etc.

### 3
Used dummy image and static placeholder text to focus on laying out UIs. 
Then organized these UI factories/helpers with extensions and some lazy vars.

### 4
Connected UI with network responses (removed the dummy content) by structuring methods from `RoomsViewController.swift`

#### Design decisions
Chose to display 1 and a half rooms on the mobile screen at once. 
Chose to make the header fixed to the top of the screen, and the rooms scroll behind it.
Made the "Book!" button look disabled when zero spots remain.
Decreased the leading (line height) between *"name"* and *"spots remaining"*.


---
With more time, 

*Utilized UILayout*:
At the moment, some UIs are set with `frame` for quick results, while other UIs are set with auto-layouts based on dynamic constraints. It would be consistant to use auto-layout. I would also add the "Rooms" label to top of the page.

*Complete the network <> UI cycle for `bookRoom` network request*:
As noted in code: depending on the complexity of the project, and coding style, we could either call the network when button is tapped, or pass in a closure variable from CollectionViewController to keep the Cell object simple&dumb.

*Refine the design pattern for different loading states*:
The design sample is simple, so MVC fits for what it needs. If there are more interactive and complex i/o, an MVC pattern might not be the best choice. 

/xcode 12.4 (12D4e), swift 5/
