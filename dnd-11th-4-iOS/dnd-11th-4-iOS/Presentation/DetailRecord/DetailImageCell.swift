//
//  DetailImageCell.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 9/1/24.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailImageCell: UICollectionViewCell {
    
    static let identifier = "DetailImageCell"
    
    let deleteButtonTappedSubject = PublishSubject<IndexPath>()
    var disposeBag = DisposeBag()
    
    let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.imageDetailEmpty
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .errorRed
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
    }
    
    private func setUI() {
        addSubviews(detailImageView)
        
        detailImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
