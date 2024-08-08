//
//  MenuAlertView.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/7/24.
//

import UIKit
import SnapKit

final class MenuAlertView: UIView {
    private let editButton: MDButton = {
        let button = MDButton(backgroundColor: .mapWhite, cornerRadius: 0)
        let resizedImage = UIImage(resource: .iconEdit).resizeImageTo(size: CGSize(width: 20, height: 20))
        button.setImageAndText(attributedString: NSAttributedString.pretendardR14("수정"), color: .black, image: resizedImage!)
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 83, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 83)
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let deleteButton: MDButton = {
        let button = MDButton(backgroundColor: .mapWhite, cornerRadius: 0)
        let resizedImage = UIImage(resource: .iconTrashcan).resizeImageTo(size: CGSize(width: 20, height: 20))
        button.setImageAndText(attributedString: NSAttributedString.pretendardR14("삭제"), color: .black, image: resizedImage!)
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 83, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 83)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
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
            $0.height.equalTo(40)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(editButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(40)
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
    
    @objc func editButtonTapped() {
        print("hit edit")
    }
    
    @objc func deleteButtonTapped() {
        print("hit delete")
    }
}
