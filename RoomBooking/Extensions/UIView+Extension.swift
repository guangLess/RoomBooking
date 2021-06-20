
import UIKit

// MARK: constraints
extension UIView {
    
    func constrainToTopAnchor(of view: UIView,
                                 padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                                 heightConstant: CGFloat) {
        
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding.left).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: padding.right).isActive = true
        heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
    }
    
    func constrainToBottomAnchor(of view: UIView,
                                 padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                                 heightConstant: CGFloat) {
        
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:0).isActive = true
        heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
    }
}

// MARK: UI helper
extension UIView {
    func removeAllSubview() {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    func roundedCorner(){
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}

// MARK: UI Factory
extension UILabel {
    static func defaultStyle(text: String? = nil,
                         font: UIFont =  UIFont.systemFont(ofSize: 30, weight: .regular),
                         textColor: UIColor = .black,
                         textAlignment: NSTextAlignment = .left,
                         numberOfLines: Int = 1) -> UILabel {
        
        let label = UILabel()
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        
        label.text = text
        label.font = font
        
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        
        label.baselineAdjustment = .none
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }
}
