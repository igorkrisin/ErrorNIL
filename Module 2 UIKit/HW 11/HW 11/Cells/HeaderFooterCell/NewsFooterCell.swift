import UIKit

class NewsFooterCell: UICollectionReusableView {
    static var reuseId = "NewsFooterCell"
    
    lazy var footerLabel = UIComponents.createTextLabel(sizeFont: 12, fontWeight: .regular, numbOfLine: 2, textColor: .appDarkGray)
    
    func setupFooter(footer: String) {
        addSubview(footerLabel)
        footerLabel.text = footer
        footerLabel.contentMode = .top
        
        NSLayoutConstraint.activate([
            footerLabel.topAnchor.constraint(equalTo: topAnchor),
            footerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            footerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            footerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            
        ])
    }
}


