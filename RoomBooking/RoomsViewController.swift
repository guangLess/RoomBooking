
import UIKit
import Foundation

class RoomsViewController: UIViewController {
    
    var collection: Rooms? {
        didSet {
            DispatchQueue.main.async {
                self.roomsCollectionView.reloadData()
            }
        }
    }
    
    var flowLayout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidth = Int(UIScreen.main.bounds.width)
        let height = cellWidth
        layout.itemSize = CGSize(width: cellWidth - 20, height: height)
        layout.minimumLineSpacing = 9
        return layout
    }
    
    lazy var roomsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var headerView: UILabel = {
        let placeHolder = "Odio nisi, lectus dis nulla. Ultrices maecenas vitae rutrum dolor ultricies donec risus sodales. Tempus quis et."
        let label = UILabel.defaultStyle(text: placeHolder,
                                         font: .systemFont(ofSize: 20, weight: .medium),
                                         textColor: .lightGray,
                                         numberOfLines: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        view.addSubview(headerView)
        let padding: CGFloat = 23
        headerView.constrainToTopAnchor(of: view,
                                        padding: UIEdgeInsets(top: padding, left: padding, bottom: -padding, right: -padding),
                                        heightConstant: CGFloat.halfScreenWidth()/2)
        
        RoomsNetworkManager().loadRooms { result in
            switch result {
            case .success(let rooms):
                DispatchQueue.main.async {
                    self.setUpCollectionView()
                    self.collection = rooms
                }
            case .failure(_):
                return
            }
        }
    }
    
    func setUpCollectionView() {
        
        roomsCollectionView.register(RoomCell.self, forCellWithReuseIdentifier: RoomCell.identifier)
        roomsCollectionView.dataSource = self
        roomsCollectionView.delegate = self
        view.addSubview(roomsCollectionView)
        
        let height = CGFloat.intrinsicCollectionViewHeight()
        roomsCollectionView.constrainToBottomAnchor(of: view, heightConstant: height)
    }
}

// MARK: delegates
extension RoomsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let emptyCell = UICollectionViewCell()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomCell.identifier,
                                                            for: indexPath) as? RoomCell else {
            return emptyCell
        }
        
        guard var room = collection?[indexPath.row],
              let imgURL = room.thumbnail else {
              return emptyCell
        }

        try? RoomsNetworkManager().loadImage(from: imgURL) { data in
            guard let imgData = data else { return }
            
            DispatchQueue.main.async {
                room.imgData = imgData
                cell.room = room
                //cell.setNeedsDisplay()
            }
        }
        
        return cell
    }
}
