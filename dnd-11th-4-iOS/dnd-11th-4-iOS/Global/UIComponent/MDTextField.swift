//
//  MDTextField.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/14/24.
//

import UIKit
import RxSwift

final class MDTextField: UITextField {
    
    private let disposeBag = DisposeBag()
    
    init(text: String = "",
         textColor: UIColor = .black2) {
        super.init(frame: .zero)
        
        self.backgroundColor = .gray20
        self.layer.cornerRadius = 8
        self.attributedText = NSAttributedString.pretendardM14(text)
        
        self.rx.text
            .compactMap { $0 }
            .distinctUntilChanged()
            .map { text in
                NSAttributedString.pretendardM14(text)
            }
            .bind(to: rx.attributedText)
            .disposed(by: disposeBag)
        
        let paddingLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        self.leftView = paddingLeftView
        self.leftViewMode = ViewMode.always
        
        paddingLeftView.backgroundColor = .errorRed
        
        let paddingReightView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        self.rightView = paddingReightView
        self.rightViewMode = ViewMode.always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    func setLeftImage(image: UIImage?) -> Self {
        let outerView = UIView()
        let iconView  = UIImageView(image: image)
        
        self.addSubview(outerView)
        outerView.addSubview(iconView)
        
        outerView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.equalTo(44)
            make.height.equalToSuperview()
        }
        
        iconView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(16)
        }
        
        self.leftView = outerView
        self.leftViewMode = ViewMode.always
        return self
    }
}
