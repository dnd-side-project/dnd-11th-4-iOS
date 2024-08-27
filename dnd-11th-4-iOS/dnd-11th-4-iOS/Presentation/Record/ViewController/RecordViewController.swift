//
//  RecordViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/14/24.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa
import RxGesture
import PhotosUI
import RxKeyboard

final class RecordViewController: UIViewController, View {
    
    typealias Reactor = RecordReactor
    var disposeBag = DisposeBag()
    
    // MARK: - UI Properties
    
    private let navigationBar = MDNavigationBar(type: .add)
    
    private let recordScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    private let contentView = UIView()
    
    private let imageScrollerView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    private let imageContentView = UIView()
    private let emptyImageView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray50.cgColor
        view.layer.cornerRadius = 6
        return view
    }()
    private let emptyImage = UIImageView(image: Constant.Image.iconPicture)
    private let addImageLabel = MDLabel(attributedString: NSAttributedString.pretendardM10("사진 추가"),
                                        textColor: .gray80)
    private let countImageLabel = MDLabel(attributedString: NSAttributedString.pretendardM10("(0/3)"),
                                          textColor: .gray80)
    private let imageLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.alignment = .center
        return stackView
    }()
    private let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.minimumLineSpacing = 6
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RecordImageCell.self, forCellWithReuseIdentifier: RecordImageCell.identifier)
        return collectionView
    }()
    
    private let regionLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("지역"), textColor: .black)
    private let placeLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("명소명"), textColor: .black)
    private let imageLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("사진"), textColor: .black)
    private let memoLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("한 줄 메모"), textColor: .black)
    private let visitedLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("방문 날짜"), textColor: .black)
    
    private let regionTextField = MDTextField(text: "인천")
    private let placeTextField = MDTextField()
    private let memoTextField = MDTextField()
    private let dateTextField = MDTextField().setLeftImage(image: Constant.Image.iconCalendar)
    
    private let placeTextLimitedLabel = MDLabel(attributedString: NSAttributedString.pretendardR10("0/20자"), textColor: .errorRed)
    private let memoTextLimitedLabel = MDLabel(attributedString: NSAttributedString.pretendardR10("7/25자"), textColor: .errorRed)
    
    private let completeButton = MDButton(backgroundColor: .black2)
        .setText(attributedString: NSAttributedString.pretendardB16("기록 작성 완료"), color: .white)
    
    private let regionPickerView = UIPickerView()
    private let regionToolbar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: Constant.Screen.width, height: 50)
        return toolBar
    }()
    private lazy var regionCancelBarButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: nil)
    private lazy var regionFlexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    private lazy var regionComplteBarButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: nil)
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko_KR")
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    private let dateToolbar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: Constant.Screen.width, height: 50)
        return toolBar
    }()
    private lazy var dateCancelBarButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: nil)
    private lazy var dateFlexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    private lazy var dateComplteBarButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: nil)
    
    
    // MARK: - Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTextField()
        setToolbar()
        setLayout()
        setDelegate()
        bindInput()
    }
    
    init(reactor: RecordReactor) {
        super.init(nibName: nil, bundle: nil)
        
        self.reactor = reactor
        self.reactor?.initialState.selectedRegion = "서울"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bindInput() {
        guard let reactor = reactor else { return }
        
        regionCancelBarButton.rx.tap
            .map { Reactor.Action.regionBarButtonTapped(.cancel) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        regionComplteBarButton.rx.tap
            .map {
                let row = self.regionPickerView.selectedRow(inComponent: 0)
                return Reactor.Action.regionBarButtonTapped(.complete(row))
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        regionTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .map { Reactor.Action.regionTapped($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        placeTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .map { Reactor.Action.placeTapped($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        emptyImageView.rx.tapGesture()
            .when(.recognized)
            .asDriver(onErrorJustReturn: .init())
            .drive(with: self, onNext: { owner, _ in
                owner.didSelectImage()
            })
            .disposed(by: disposeBag)
        
        memoTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .map { Reactor.Action.memoTapped($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        datePicker.rx.date
            .map { Reactor.Action.dateTapped($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        dateCancelBarButton.rx.tap
            .withUnretained(self)
            .compactMap { owner, _ in owner.reactor }
            .bind { reactor in
                self.dateTextField.text = nil
                self.dateTextField.resignFirstResponder()
            }
            .disposed(by: disposeBag)
        
        dateComplteBarButton.rx.tap
            .withUnretained(self)
            .compactMap { owner, _ in owner.reactor }
            .bind { reactor in
                self.dateTextField.text = reactor.initialState.selectedDate
                self.dateTextField.resignFirstResponder()
            }
            .disposed(by: disposeBag)
    }
    
    func bind(reactor: RecordReactor) {
        Observable.just(reactor.initialState.regionArray)
            .bind(to: regionPickerView.rx.itemTitles) { _, item in
                return item
            }
            .disposed(by: disposeBag)
        
        reactor.state.map {$0.selectedRegion}
            .asDriver(onErrorJustReturn: "잠시 후 다시 실행해 주세요")
            .drive(regionTextField.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.placeText }
            .asDriver(onErrorJustReturn: "잠시 후 다시 실행해 주세요")
            .drive(placeTextField.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.placeText }
            .map { text in "\(text.count)/20" }
            .asDriver(onErrorJustReturn: "잠시 후 다시 실행해 주세요")
            .drive(placeTextLimitedLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.compactMap{ $0.selectedArrayImage }
            .bind(to: imageCollectionView.rx.items) { (collectionView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordImageCell.identifier, for: indexPath) as! RecordImageCell
                cell.recordImage.image = element
                return cell
            }
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.memoText }
            .asDriver(onErrorJustReturn: "잠시 후 다시 실행해 주세요")
            .drive(memoTextField.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.memoText }
            .map { text in "\(text.count)/25" }
            .asDriver(onErrorJustReturn: "0/25")
            .drive(memoTextLimitedLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.selectedDate }
            .asDriver(onErrorJustReturn: "2024년 08월 27일")
            .drive(dateTextField.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.regionButtonState }
            .observe(on: MainScheduler.asyncInstance)
            .asDriver(onErrorJustReturn: "2024년 08월 27일")
            .drive(with: self, onNext: { owner, text in
                owner.regionTextField.text = text
                owner.regionTextField.resignFirstResponder()
            })
            .disposed(by: disposeBag)
        
        regionPickerView.rx.itemSelected
            .withUnretained(self)
            .map { owner, index in
                return self.reactor?.initialState.regionArray[index.row]
            }
            .bind(to: regionTextField.rx.text)
            .disposed(by: disposeBag)
        
        RxKeyboard.instance.visibleHeight
            .skip(1)
            .filter { [weak self] _ in
                return self?.dateTextField.isFirstResponder == true || self?.memoTextField.isFirstResponder == true
            }
            .map { [weak self] keyboardHeight -> CGFloat in
                guard let self = self else { return 0.0 }
                return self.calculateMovedY(keyboardHeight)
            }
            .drive(with: self, onNext: { _, height  in
                // 텍스트 필드가 화면 중앙에 위치하도록 뷰를 이동시킴
                if height > 0 {
                    UIView.animate(withDuration: 0.3) {
                        self.view.frame.origin.y = -height
                    }
                } else {
                    // 키보드가 내려가면 뷰를 원래 위치로 복구
                    UIView.animate(withDuration: 0.3) {
                        self.view.frame.origin.y = 0
                    }
                }
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Method
    
    private func calculateMovedY(_ height: CGFloat) -> CGFloat {
        let selectedTextField = self.dateTextField.isFirstResponder ? self.dateTextField : self.memoTextField
        let textFieldY = self.view.convert(selectedTextField.frame, from: selectedTextField.superview).minY
        
        // 화면의 중앙 Y 좌표 계산 (키보드 높이를 고려)
        let centerY = (self.view.frame.height - height) / 1.2
        return textFieldY - centerY
    }
    
    private func setUI() {
        view.backgroundColor = .mapWhite
    }
    
    private func setToolbar() {
        regionToolbar.setItems([regionCancelBarButton, regionFlexibleSpace, regionComplteBarButton], animated: false)
        dateToolbar.setItems([dateCancelBarButton, dateFlexibleSpace, dateComplteBarButton], animated: false)
    }
    
    private func setTextField() {
        regionTextField.tintColor = .clear
        regionTextField.inputView = regionPickerView
        regionTextField.inputAccessoryView = regionToolbar
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = dateToolbar
    }
    
    private func setDelegate() {
        regionTextField.delegate = self
    }
    
    func didSelectImage() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [weak self] status in
            DispatchQueue.main.async {
                switch status {
                case .authorized, .limited:
                    self?.presentPickerView()
                case .denied, .restricted:
                    self?.showPickerViewAccessDeniedAlert()
                case .notDetermined:
                    self?.didSelectImage()
                default: break
                }
            }
        }
    }
    
    private func showPickerViewAccessDeniedAlert() {
        let alert = UIAlertController(title: "사진 접근 권한이 없습니다",
                                      message: "설정에서 사진 접근 권한을 허용해주세요.",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL)
            }
        })
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        self.present(alert, animated: true)
    }
    
    private func presentPickerView() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 3
        configuration.filter = .images
        configuration.selection = .ordered
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        self.present(picker, animated: true)
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        view.addSubviews(navigationBar, recordScrollView)
        recordScrollView.addSubview(contentView)
        contentView.addSubviews(regionLabel, regionTextField, placeLabel, placeTextLimitedLabel, placeTextField,
                                imageLabel, imageScrollerView, memoLabel, memoTextLimitedLabel, memoTextField,
                                visitedLabel, dateTextField, completeButton)
        imageScrollerView.addSubview(imageContentView)
        imageContentView.addSubviews(emptyImageView, imageCollectionView)
        emptyImageView.addSubview(imageLabelStackView)
        imageLabelStackView.addArrangedSubview(emptyImage)
        imageLabelStackView.addArrangedSubview(addImageLabel)
        imageLabelStackView.addArrangedSubview(countImageLabel)
        
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
        
        imageScrollerView.snp.makeConstraints { make in
            make.top.equalTo(imageLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
        
        imageContentView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.edges.equalToSuperview()
        }
        
        emptyImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.height.equalTo(90)
        }
        
        emptyImage.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        
        imageLabelStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        imageCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(emptyImageView.snp.trailing).offset(6)
            make.top.bottom.trailing.equalToSuperview()
            make.width.equalTo(270+18)
        }
        
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(imageScrollerView.snp.bottom).offset(28)
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
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(visitedLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(170)
            make.height.equalTo(40)
        }
        
        completeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(37)
            make.leading.trailing.equalToSuperview().inset(11)
            make.height.equalTo(52)
        }
    }
}

extension RecordViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProvider = results.compactMap { $0.itemProvider }
        self.reactor?.action.onNext(.imageAddTapped(itemProvider))
    }
}

extension RecordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == regionTextField || textField == dateTextField {
            return false
        }
        return true
    }
}
