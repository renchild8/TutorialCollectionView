
import UIKit

class ViewController: UIViewController{
    
    var tutorialCollectionView: TutorialCollectionView!
    var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        setTutorialCollectionView()
    }
    
    func setTutorialCollectionView() {
        let safeArea = self.view.safeAreaInsets
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        
        let collectionViewFrame = CGRect (x: safeArea.left,
                                          y: safeArea.top,
                                          width: viewWidth - safeArea.left - safeArea.right,
                                          height: viewHeight - safeArea.top - safeArea.bottom)
        
        // CollectionViewのレイアウトをセット
        layout = setLayout(width: viewWidth, height: viewHeight)
        
        // CollectionViewを生成
        tutorialCollectionView = TutorialCollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        
        // CollectionViewをViewに追加する
        self.view.addSubview(tutorialCollectionView)
    }
    
    func setLayout(width: CGFloat, height: CGFloat) -> UICollectionViewFlowLayout {
        // CollectionViewのレイアウトを生成
        let layout = UICollectionViewFlowLayout()
        
        // Cell一つ一つの大きさを設定
        layout.itemSize = CGSize(width: width, height: height)
        
        // Cellの行間隔を設定
        layout.minimumLineSpacing = 0
        
        // Cellの列間隔を設定
        layout.minimumInteritemSpacing = 0
        
        // CollectionViewのスクロールの方向を横にする
        layout.scrollDirection = .horizontal
        
        return layout
    }
    
}
