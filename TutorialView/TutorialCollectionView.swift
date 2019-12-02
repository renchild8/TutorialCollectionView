
import UIKit

class TutorialCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        // Cellに使われるクラスを登録
        self.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        // dataSourceを自身に設定
        self.dataSource = self
        
        // ページングさせる
        self.isPagingEnabled = true
        
        // ScrollIndicatorを非表示にする
        self.showsHorizontalScrollIndicator = false
    }
}

extension TutorialCollectionView: UICollectionViewDataSource {
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


