
Project walkthrough, steps in order.

## 1
Started with `Models.swift` and `RoomModelTest.swift` to set the model structure. 

## 2
Build `URLRequest` instances based on `host` & `APIPath` in `NetworkRequest.swift`  with test cases.
`RoomsNetworkManager.swift`  coordinates network calls, decoding data, etc

## 3
Used dummy image and static placeholder text to focus on laying out UIs. 
Then organized these UI factories/helpers with extensions and some lazy vars.

## 4
Connected UI with network responses by structuring methods from `RoomsViewController.swift`


With more time, 

~Utilized UILayout~:  at the moment, some UIs are set with `frame` for quick results. Some UIs are set with auto-layouts based on dynamic constraints. 

~Complete the network <> UI cycle for `bookRoom` network request~: as noted in code, depending on the complexity of the project, and coding style. We could either call the network call when button is tapped, or pass in a closure variable from CollectionViewController to keep the Cell object simple&dumb.

~Refine the design pattern for different loading states ~ : the design sample is simple, so MVC fits for what it needs. If there are more interactive and complex i/o, MVC pattern might not be a fitted choice. 
