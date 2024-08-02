//
//  MTToastView.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/1/24.
//

import UIKit
import SnapKit

enum ToastViewType {
    case onboarding, complete
    
    var text: String {
        switch self {
        case .onboarding:
            return "지도를 선택하여 지도를 색칠해보세요"
        case .complete:
            return "여행 기록이 성공적으로 완료되었어요"
        }
    }
}

final class MTToastView: UIView {
    
    private let detailText = MTLabel(font: NSAttributedString.pretendardSB3("아무값"), color: .white)
//    private let detailText = UILabel()
    private let image = UIImageView()
    
    init(type: ToastViewType) {
        super.init(frame: .zero)
        
        self.backgroundColor = .mapBlack
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        
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
            /// 현재 문제 코드
            self.detailText.attributedText = NSAttributedString(string: type.text)
            
            /// 일반 라벨로는 레이아웃 잘 잡히는 거 확인
//            self.detailText.font = UIFont(name: "Pretendard-SemiBold", size: 16)!
//            self.detailText.text = "여행 기록이 성공적으로 완료되었어요"
//            self.detailText.textColor = .white
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
        }
    }
    
}
