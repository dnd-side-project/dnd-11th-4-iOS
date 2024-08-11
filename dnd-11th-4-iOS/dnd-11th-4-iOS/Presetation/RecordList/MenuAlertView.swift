//
//  MenuAlertView.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/7/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class MenuAlertView: UIView {
    let deleteButtonTapped = PublishSubject<Void>()
    let editButtonTapped = PublishSubject<Void>()
    private let disposeBag = DisposeBag()
    
    private let editButton: MDButton = {
        let button = MDButton(backgroundColor: .mapWhite, cornerRadius: 0)
        button.setResizedImage(attributedString: NSAttributedString.pretendardR14("수정"), color: .black, image: .iconEdit, width: 20, height: 20)
        return button
    }()
    
    private let deleteButton: MDButton = {
        let button = MDButton(backgroundColor: .mapWhite, cornerRadius: 0)
        button.setResizedImage(attributedString: NSAttributedString.pretendardR14("삭제"), color: .black, image: .iconTrashcan, width: 20, height: 20)
        return button
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray50
        view.isUserInteractionEnabled = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupAppearance()
        didTapDeleteButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupAppearance()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            print(#function)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [editButton, separator, deleteButton].forEach { view in
            addSubview(view)
        }
        
        editButton.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(37)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(editButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(37)
        }
    }
    
    private func setupAppearance() {
        self.backgroundColor = .mapWhite
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.gray60.cgColor
        self.layer.borderWidth = 1.0
        
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 8)
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.shadowColor = UIColor.gray40.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 2.0
    }
    
    func didTapEditButton() {
        print("hit edit")
    }
    
    func didTapDeleteButton() {
        deleteButton.rx.tap
            .bind(onNext: { [weak self] in
                self?.deleteButtonTapped.onNext(())
                print("hit delete")
            })
            .disposed(by: disposeBag)
    }
}
