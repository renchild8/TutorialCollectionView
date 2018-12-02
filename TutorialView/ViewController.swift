// ViewController.swift
import UIKit

class ViewController: UIViewController{
    
    var tutorialCollectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        
        let collectionViewFrame = CGRect (x: 0, y: 0, width: viewWidth, height: viewHeight)
        
        // CollectionViewのレイアウトを生成
        layout = UICollectionViewFlowLayout()
        
        // Cell一つ一つの大きさを設定
        layout.itemSize = CGSize(width: viewWidth, height: viewHeight)
        
        // Cellの行間隔を設定
        layout.minimumLineSpacing = 0
        
        // Cellの列間隔を設定
        layout.minimumInteritemSpacing = 0
        
        // CollectionViewのスクロールの方向を横にする
        layout.scrollDirection = .horizontal
        
        // CollectionViewを生成
        tutorialCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        
        // Cellに使われるクラスを登録
        tutorialCollectionView.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        // dataSourceを自身に設定
        tutorialCollectionView.dataSource = self
        
        // ページングさせる
        tutorialCollectionView.isPagingEnabled = true
        
        // ScrollIndicatorを非表示にする
        tutorialCollectionView.showsHorizontalScrollIndicator = false
        
        // CollectionViewをViewに追加する
        self.view.addSubview(tutorialCollectionView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // ViewDidLoadではSafeAreaが取得できないのでここでリサイズ
        let safeArea = self.view.safeAreaInsets
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        let collectionViewFrame = CGRect (x: safeArea.left, y: safeArea.top, width: viewWidth - safeArea.left, height: viewHeight - safeArea.top - safeArea.bottom)
        
        layout.itemSize = CGSize(width: viewWidth - safeArea.left, height: viewHeight - safeArea.top - safeArea.bottom)
        
        tutorialCollectionView.frame = collectionViewFrame
        
    }
    
}

extension ViewController: UICollectionViewDataSource{
    
    // Cellの数を設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // Cellに値を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath as IndexPath) as! CustomUICollectionViewCell
        
        // Cellに応じてbackgroundColorを変更
        switch indexPath.row {
        case 0:
            cell.backgroundColor = UIColor.blue
        case 1:
            cell.backgroundColor = UIColor.orange
        case 2:
            cell.backgroundColor = UIColor.yellow
        case 3:
            cell.backgroundColor = UIColor.green
        case 4:
            cell.backgroundColor = UIColor.red
        default:
            break
        }
        
        cell.textLabel?.text = "\(indexPath.row + 1)ページ目"
        
        return cell
    }
    
}
