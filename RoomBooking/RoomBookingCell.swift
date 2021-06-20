
import UIKit

class RoomCell: UICollectionViewCell {
    
    static let identifier = String(describing: RoomCell.self)
    
    var room: Room? {
        willSet {
            contentView.removeAllSubview()
        }
        
        didSet {
            switch room {
            case .some(let thisRoom):
                    self.configureCell(with: thisRoom)
            case nil:
                return
            }
        }
    }
    
    private lazy var button : UIButton = {
        
        let button = UIButton(frame: CGRect.zero)
        button.setTitle("Book!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.roundedCorner()
        button.backgroundColor = .customPurple()
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var nameTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private func configureCell(with room: Room) {
        
        // NOTE: better to have a placeholder img
        guard let imgData = room.imgData,
              let name = room.name,
              let spots = room.spots else {
            return
        }
        
        let padding: CGFloat = 10
        let heightUnit: CGFloat = 30
        let imgHeight = contentView.frame.size.height * 2/3
        
        // add imageView
        addImageView(imgData, imgHeight: imgHeight)
        
        // add booking btn
        let buttonFrame = CGRect(
            x: ( contentView.frame.size.width - CGFloat.oneThriedScreenWidth()),
            y: (imgHeight + padding * 1.5),
            width: CGFloat.oneThriedScreenWidth() - padding,
            height: heightUnit * 1.5)
        addBookingButton(padding, buttonFrame)
        
        // add room name title
        let nameLabelFrame = CGRect(x: padding,
                                    y: imgHeight + padding,
                                    width: CGFloat.oneThriedScreenWidth(),
                                    height: heightUnit)
        
        addNameLable(text: name, nameLabelFrame)
        
        // add spots label
        let spotsLabelFrame = CGRect(x: padding,
                                     y: nameLabelFrame.origin.y + heightUnit + padding ,
                                     width: CGFloat.halfScreenWidth() + padding,
                                     height: heightUnit)
        let spotsText = String(spots) + " spots remaining"
        addSpotsLabel(text: spotsText, spotsLabelFrame)
    }
    
    
    private func addImageView(_ imgData: Data, imgHeight: CGFloat) {
        
        let img = UIImage(data: imgData)
        let imgView = UIImageView(image: img)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.roundedCorner()
        
        contentView.addSubview(imgView)
        imgView.constrainToTopAnchor(of: contentView, heightConstant: imgHeight)
    }
    
    private func addBookingButton(_ spacer: CGFloat, _ frame: CGRect) {
        contentView.addSubview(button)
        button.frame = frame
        
        button.addTarget(self, action: #selector(bookSelected), for: .touchUpInside)
    }
    
    private func addNameLable(text: String, _ frame: CGRect) {
        let nameTitle = UILabel.defaultStyle(text: text,
                                             font: UIFont.systemFont(ofSize: 27, weight: .semibold),
                                             textColor: .black)
        contentView.addSubview(nameTitle)
        nameTitle.frame = frame
    }
    
    private func addSpotsLabel(text: String, _ frame: CGRect) {
        let spotsLabel = UILabel.defaultStyle(text: text,
                                              font: UIFont.systemFont(ofSize: 22, weight: .thin),
                                              textColor: .customPurple())
        contentView.addSubview(spotsLabel)
        spotsLabel.frame = frame
    }
    
    @objc func bookSelected() {
        // fetch result or an injected call-back, depending on the pattern choice
    }
}

