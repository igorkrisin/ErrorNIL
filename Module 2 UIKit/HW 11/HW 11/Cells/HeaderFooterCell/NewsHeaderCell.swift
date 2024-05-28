import UIKit

class NewsHeaderCell: UICollectionReusableView {
    
    static var reuseId = "NewsHeaderCell"
    
    private lazy var headerStack: UIStackView = UIComponents.createStack(axis: .horizontal, distribution: .equalSpacing, alignment: .center)
    
    private lazy var headerText: UILabel = UIComponents.createTextLabel(sizeFont: 20, fontWeight: .bold, numbOfLine: 1, textColor: .black)
    
    private lazy var headerBtn: UIButton = UIComponents.createButton(titleText: "", textColor: .clear, action: headerBtnAction)
    
    private lazy var headerBtnAction = UIAction { [weak self] action in
       print("Header BTN")
    }
    
    func setupHeader(header: String) {
        headerStack.addArrangedSubview(headerText)
        headerStack.addArrangedSubview(headerBtn)
        addSubview(headerStack)
        headerBtn.setImage(UIImage(named: "newsHeaderBtn"), for: .normal)
        
        headerText.text = header
        
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: topAnchor),
            headerStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            headerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
        ])
    }
}
