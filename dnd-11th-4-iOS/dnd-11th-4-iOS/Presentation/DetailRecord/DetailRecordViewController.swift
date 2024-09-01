//
//  DetailRecordViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/31/24.
//

import UIKit

import RxSwift
import ReactorKit

final class DetailRecordViewController: UIViewController, View {
    
   var dispoasBag = DisposeBag()
    typealias Reactor = DetailRecordReactor
    
    private let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.dimmedBlack.withAlphaComponent(1.0)
        return view
    }()
    private let deleteButton = MDButton(backgroundColor: .clear)
        .setText(attributedString: NSAttributedString.pretendardB14("삭제"), color: .gray60)
    private let editButton = MDButton(backgroundColor: .clear)
        .setText(attributedString: NSAttributedString.pretendardB14("수정"), color: .gray60)
    private let detailPopUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray10
        view.layer.cornerRadius = 16
        return view
    }()
    private let detailImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Constant.Screen.width-86, height: 430)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DetailImageCell.self, forCellWithReuseIdentifier: DetailImageCell.identifier)
        return collectionView
    }()
    private lazy var imagePageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        return pageControl
    }()
    private let regionAndPlaceLabel = MDLabel(textColor: .white)
    private let explanationLabel = MDLabel(textColor: .black)
    private let dateLabel = MDLabel(textColor: .newGray)
    private let backButton = MDButton(backgroundColor: .black4, cornerRadius: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    
    func bind(reactor: DetailRecordReactor) {
        backButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in
                owner.self.dismiss(animated: true)
            }
            .disposed(by: dispoasBag)
    }
    
    private func setLayout() {
        view.addSubview(dimmedView)
        dimmedView.addSubviews(detailPopUpView, deleteButton, editButton, backButton)
        detailPopUpView.addSubviews(regionAndPlaceLabel, detailImageCollectionView, explanationLabel, dateLabel)
        
        dimmedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        detailPopUpView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(122)
            make.centerX.equalToSuperview()
            make.width.equalTo(Constant.Screen.width-50)
            make.height.equalTo(544)
        }
        
        editButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.trailing.equalToSuperview().inset(28)
            make.width.equalTo(45)
            make.height.equalTo(40)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.trailing.equalTo(editButton.snp.leading)
            make.width.equalTo(45)
            make.height.equalTo(40)
        }
        
        detailImageCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(19)
            make.leading.trailing.equalToSuperview().inset(17)
            make.bottom.equalTo(explanationLabel.snp.top).offset(22)
        }
        
        regionAndPlaceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(31)
            make.centerX.equalToSuperview()
        }
        
        // TODO: leading, training layout 추가
        
        explanationLabel.snp.makeConstraints { make in
            make.top.equalTo(detailImageCollectionView.snp.bottom).offset(22)
            make.centerX.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(explanationLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-32)
            make.leading.trailing.equalToSuperview().inset(11)
            make.height.equalTo(52)
        }
    }
}
