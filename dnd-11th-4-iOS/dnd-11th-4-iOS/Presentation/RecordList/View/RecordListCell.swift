//
//  RecordListCell.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/6/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

/// 임시 데이터
struct Test: Hashable {
    let image: UIImage
    let title: String
    let memo: String
    let date: String
    let id: UUID = UUID()
}

final class RecordListCell: UICollectionViewCell {
    let deleteButtonTapped = PublishSubject<Void>()
    let editButtonTapped = PublishSubject<Void>()
    private let disposeBag = DisposeBag()
    
    static let identifier = "RecordListCell"
    private let recordImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    private let titleLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("title"), textColor: .mapBlack)
    private let memoLabel = MDLabel(attributedString: NSAttributedString.pretendardR14("memo"), textColor: .black3)
    private let calendarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(resource: .iconCalendar)
        imageView.tintColor = .gray60
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let dateLabel = MDLabel(attributedString: NSAttributedString.pretendardR12("date"), textColor: .black4)
    private let menuButton: MDButton = {
        let button = MDButton(backgroundColor: .clear, cornerRadius: 0)
        button.setImage(image: UIImage(resource: .iconDetail))
        button.imageView?.tintColor = .gray60
        return button
    }()
    private let menuView: MenuAlertView = {
        let view = MenuAlertView()
        view.isHidden = true
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        showMenu()
        didTapDeleteButton()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        menuView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [recordImage, titleLabel, memoLabel, calendarImage, dateLabel, menuButton].forEach { view in
            contentView.addSubview(view)
        }
        
        self.addSubview(menuView)
        
        recordImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(76)
            $0.width.equalTo(62)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalTo(recordImage.snp.trailing).offset(10)
            $0.trailing.equalTo(menuButton.snp.leading).offset(-10)
        }
        
        memoLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalTo(recordImage.snp.trailing).offset(10)
            $0.trailing.equalTo(menuButton.snp.leading).offset(-10)
        }
        
        calendarImage.snp.makeConstraints {
            $0.top.equalTo(memoLabel.snp.bottom).offset(6)
            $0.leading.equalTo(recordImage.snp.trailing).offset(10)
            $0.height.width.equalTo(16)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(calendarImage.snp.trailing).offset(4)
            $0.centerY.equalTo(calendarImage)
        }
        
        menuButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview()
            $0.height.width.equalTo(20)
        }
        
        menuView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalTo(menuButton.snp.leading).offset(-5)
            $0.width.equalTo(156)
            $0.height.greaterThanOrEqualTo(75)
        }
    }
    
    private func showMenu() {
        menuButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.menuView.isHidden.toggle()
                if !self.menuView.isHidden {
                    self.bringSubviewToFront(self.menuView)
                    self.layoutIfNeeded()
                }
            })
            .disposed(by: disposeBag)
    }
    
    func configure(with record: Test) {
        titleLabel.attributedText = NSAttributedString.pretendardSB14(record.title)
        memoLabel.attributedText = NSAttributedString.pretendardR14(record.memo)
        dateLabel.attributedText = NSAttributedString.pretendardR12(record.date)
        recordImage.image = record.image
    }
    
    func didTapDeleteButton() {
        menuView.deleteButtonTapped
            .subscribe(onNext: {
                self.deleteButtonTapped.onNext(())
                print("cell")
            })
            .disposed(by: disposeBag)
    }
}
