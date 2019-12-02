
import UIKit

class TutorialCollectionViewCell: UICollectionViewCell {
    
    public static let identifier = "TutorialCollectionViewCell"
    
    private var pageNumberLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addLabel() {
        // UILabelを生成.
        pageNumberLabel = UILabel(frame: CGRect(x:0, y:0, width:frame.width, height:frame.height))
        pageNumberLabel.text = ""
        pageNumberLabel.textAlignment = NSTextAlignment.center
        
        // Cellに追加.
        self.contentView.addSubview(pageNumberLabel)
    }
    
    public func setCell(indexPath: IndexPath) {
        // Cellに応じてbackgroundColorを変更
        switch indexPath.row {
        case 0:
            self.backgroundColor = UIColor.blue
        case 1:
            self.backgroundColor = UIColor.orange
        case 2:
            self.backgroundColor = UIColor.yellow
        case 3:
            self.backgroundColor = UIColor.green
        case 4:
            self.backgroundColor = UIColor.red
        default:
            break
        }
        
        pageNumberLabel.text = "\(indexPath.row + 1)ページ目"
    }
    
}
