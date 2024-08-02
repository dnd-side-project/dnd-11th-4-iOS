//
//  MTToastView.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/1/24.
//

import UIKit
import SnapKit

enum ToastViewType {
    case onboarding, complete, delete
    
    var text: String {
        switch self {
        case .onboarding:
            return "지도를 선택하여 지도를 색칠해보세요"
        case .complete:
            return "여행 기록이 성공적으로 완료되었어요"
        case .delete:
            return "기록이 삭제되었어요"
        }
    }
}

final class MTToastView: UIView {
    
    private let detailText = MTLabel(attributedString: NSAttributedString.pretendardSB3("dummy"), color: .mapWhite)
    private let image = UIImageView()
    
    init(type: ToastViewType) {
        super.init(frame: .zero)
        
        self.backgroundColor = .mapBlack
        
        switch type {
        case .delete:
            self.layer.cornerRadius = 6
        default:
            self.layer.cornerRadius = 25
        }
        
        setUI(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(type: ToastViewType) {
        switch type {
        case .onboarding:
            self.detailText.attributedText = NSAttributedString(string: type.text)
            self.image.backgroundColor = .errorRed
            
            self.addSubviews(detailText, image)
            detailText.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().inset(27)
            }
            image.snp.makeConstraints { make in
                make.leading.equalTo(detailText.snp.trailing)
                make.bottom.equalToSuperview()
                make.width.height.equalTo(74)
            }
        case .complete:
            self.detailText.attributedText = NSAttributedString(string: type.text)
            self.image.backgroundColor = .errorRed
            
            self.addSubviews(detailText, image)
            image.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(22)
                make.centerY.equalToSuperview()
                make.width.height.equalTo(26)
            }
            detailText.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalTo(image.snp.trailing).offset(9)
            }
        case .delete:
            self.detailText.attributedText = NSAttributedString.pretendardM2(type.text)
            
            self.addSubviews(detailText, image)
            detailText.snp.makeConstraints { make in
                make.centerY.centerX.equalToSuperview()
            }
        }
    }
    
}
