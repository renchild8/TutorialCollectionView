
import UIKit

class TutorialCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        // Cellに使われるクラスを登録
        self.register(TutorialCollectionViewCell.self, forCellWithReuseIdentifier: TutorialCollectionViewCell.identifier)
        
        // dataSourceを自身に設定
        self.dataSource = self
        
        // ページングさせる
        self.isPagingEnabled = true
        
        // ScrollIndicatorを非表示にする
        self.showsHorizontalScrollIndicator = false
        
        // BackgroundColorを白にする。
        self.backgroundColor = .white
    }
}

extension TutorialCollectionView: UICollectionViewDataSource {
    // Cellの数を設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // Cellに値を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Cellを取得
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialCollectionViewCell.identifier, for: indexPath as IndexPath) as? TutorialCollectionViewCell else { return UICollectionViewCell() }
        // Cellに値を設定する
        cell.setCell(indexPath: indexPath)
        
        return cell
    }
    
}
