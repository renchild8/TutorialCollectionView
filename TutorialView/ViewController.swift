//
//  ViewController.swift
//  TutorialView
//
//  Created by 佐藤優 on 2018/12/01.
//  Copyright © 2018 佐藤優. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var tutorialCollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewWidth = self.view.frame.width
        let collectionViewHeight = self.view.frame.height
        let collectionViewFrame = CGRect (x: 0, y: 0, width: collectionViewWidth, height: collectionViewHeight)
        
        let lineSpacing:CGFloat = 0
        let rowSpacing:CGFloat = 0
        let margin:CGFloat = 0
        
        // CollectionViewのレイアウトを生成.
        let layout = UICollectionViewFlowLayout()
        
        // Cell一つ一つの大きさ.
        layout.itemSize = CGSize(width: collectionViewWidth - rowSpacing, height: collectionViewHeight - lineSpacing)
        
        // Cellの行間隔
        layout.minimumLineSpacing = lineSpacing

        // Cellの列間隔
        layout.minimumInteritemSpacing = rowSpacing

        // Cellのマージン.
        layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        // スクロールの方向を横にする
        layout.scrollDirection = .horizontal
        
        // CollectionViewを生成.
        tutorialCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        
        // Cellに使われるクラスを登録.
        tutorialCollectionView.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        tutorialCollectionView.delegate = self
        tutorialCollectionView.dataSource = self
        
        tutorialCollectionView.isPagingEnabled = true
        
        tutorialCollectionView.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.25)
        
        self.view.addSubview(tutorialCollectionView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // ViewDidLoadではSafeAreaが取得できないのでここでリサイズ
        let safeArea = self.view.safeAreaInsets
        let collectionViewWidth = self.view.frame.width
        let collectionViewHeight = self.view.frame.height
        let collectionViewFrame = CGRect (x: safeArea.left, y: safeArea.top, width: collectionViewWidth - safeArea.left, height: collectionViewHeight - safeArea.top - safeArea.bottom)
        
        tutorialCollectionView.frame = collectionViewFrame
        
    }
    
    // Cellの総数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // Cellに値を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath as IndexPath) as! CustomUICollectionViewCell
        
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
