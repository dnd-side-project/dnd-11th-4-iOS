//
//  RecordViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/14/24.
//

import UIKit

final class RecordViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let navigationBar = MDNavigationBar(type: .add)
    
    private let recordScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private let imageCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        return collectionView
    }()
    
    private let contentView = UIView()
    
    private let regionLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("지역"), textColor: .black)
    private let placeLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("명소명"), textColor: .black)
    private let imageLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("사진"), textColor: .black)
    private let memoLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("한 줄 메모"), textColor: .black)
    private let visitedLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("방문 날짜"), textColor: .black)
    
    private let regionTextField = MDTextField(text: "서울")
    private let placeTextField = MDTextField()
    private let memoTextField = MDTextField()
    private let visitedTextField = MDTextField().setLeftImage(image: Constant.Image.iconCalendar)
    
    private let placeTextLimitedLabel = MDLabel(attributedString: NSAttributedString.pretendardR10("0/20자"), textColor: .errorRed)
    private let memoTextLimitedLabel = MDLabel(attributedString: NSAttributedString.pretendardR10("7/25자"), textColor: .errorRed)
    
    private let completeButton = MDButton(backgroundColor: .black2)
        .setText(attributedString: NSAttributedString.pretendardB16("기록 수정 완료"), color: .white)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    // MARK: - Bind
    
    // MARK: - Method
    
    private func setUI() {
        view.backgroundColor = .mapBackground
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        view.addSubviews(navigationBar, recordScrollView)
        recordScrollView.addSubview(contentView)
        contentView.addSubviews(regionLabel, regionTextField, placeLabel, placeTextLimitedLabel, placeTextField,
                                imageLabel, imageCollectionView, memoLabel, memoTextLimitedLabel, memoTextField,
                                 visitedLabel, visitedTextField, completeButton)
        
        navigationBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        recordScrollView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        
        regionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(19)
            make.leading.equalToSuperview().inset(16)
        }
        
        regionTextField.snp.makeConstraints { make in
            make.top.equalTo(regionLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(Constant.Screen.width-32)
            make.height.equalTo(40)
        }
        
        placeLabel.snp.makeConstraints { make in
            make.top.equalTo(regionTextField.snp.bottom).offset(19)
            make.leading.equalToSuperview().inset(16)
        }
        
        placeTextLimitedLabel.snp.makeConstraints { make in
            make.centerY.equalTo(placeLabel)
            make.trailing.equalToSuperview().inset(16)
        }
        
        placeTextField.snp.makeConstraints { make in
            make.top.equalTo(placeLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(Constant.Screen.width-32)
            make.height.equalTo(40)
        }
        
        imageLabel.snp.makeConstraints { make in
            make.top.equalTo(placeTextField.snp.bottom).offset(22)
            make.leading.equalToSuperview().inset(16)
        }
        
        imageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(imageLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(90)
        }
        
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(imageCollectionView.snp.bottom).offset(28)
            make.leading.equalToSuperview().inset(16)
        }
        
        memoTextLimitedLabel.snp.makeConstraints { make in
            make.centerY.equalTo(memoLabel)
            make.trailing.equalToSuperview().inset(16)
        }
        
        memoTextField.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(Constant.Screen.width-32)
            make.height.equalTo(40)
        }
        
        visitedLabel.snp.makeConstraints { make in
            make.top.equalTo(memoTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(16)
        }
        
        visitedTextField.snp.makeConstraints { make in
            make.top.equalTo(visitedLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(149)
            make.height.equalTo(40)
        }
        
        completeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(37)
            make.leading.trailing.equalToSuperview().inset(11)
            make.height.equalTo(52)
        }
    }
}
