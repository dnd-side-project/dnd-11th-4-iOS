//
//  RecordImageCell.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/20/24.
//

import UIKit
import RxSwift
import RxCocoa

final class RecordImageCell: UICollectionViewCell {
    
    static let identifier = "RecordImageCell"
    
    let deleteButtonTappedSubject = PublishSubject<IndexPath>()
    var disposeBag = DisposeBag()
    
    var recordImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.imageEmpty
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    let deleteButton = UIImageView(image: Constant.Image.iconXCircle)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
        
        bind()
    }
    
    private func setUI() {
        
        addSubviews(recordImage, deleteButton)
        
        recordImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(6)
            make.width.height.equalTo(20)
        }
    }
    
    private func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UICollectionView else { return nil }
        return superView.indexPath(for: self)
    }
    
    private func bind() {
        deleteButton.rx.tapGesture()
            .when(.recognized)
            .compactMap{ _ in self.getIndexPath() }
            .subscribe(with: self) { owner, indexPath in
                owner.deleteButtonTappedSubject.onNext(indexPath)
            }
            .disposed(by: disposeBag)
    }
}
