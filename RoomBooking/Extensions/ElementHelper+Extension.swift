
import UIKit

// Only read the item that has all the data returned from the service.
extension Array where Element == Room {
    func trimCollection() -> Rooms {
        
        return self.filter { room in
                room.name != nil
                && room.thumbnail != nil
                && room.spots != nil
        }
    }
}

extension UIColor {
    static func customPurple() -> UIColor {
        let color = UIColor.init(displayP3Red: 157/255,
                                 green: 17/255,
                                 blue: 133/255,
                                 alpha: 1)
        return color
    }
}

// MARK: measurements according to screen size
extension CGFloat {
    static func intrinsicCollectionViewHeight() -> CGFloat {
        return  UIScreen.main.bounds.size.height * 3/4
    }
    
    static func halfScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width/2
    }
    
    static func oneThriedScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width/3
    }
}
