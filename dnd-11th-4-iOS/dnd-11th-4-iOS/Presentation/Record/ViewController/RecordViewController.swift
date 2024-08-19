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
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
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
    
    func bind(reactor: RecordReactor) {
        // 취소하면 기존 text로 다시
        regionCancelBarButton.rx.tap
            .withUnretained(self)
            .compactMap { owner, _ in owner.reactor }
            .bind { reactor in
                self.regionTextField.text = reactor.initialState.selectedRegion
                self.regionTextField.resignFirstResponder()
            }
            .disposed(by: disposeBag)
        
        regionComplteBarButton.rx.tap
            .withUnretained(self)
            .compactMap { owner, _ in owner.reactor }
            .bind { reactor in
                let row = self.regionPickerView.selectedRow(inComponent: 0)
                reactor.initialState.selectedRegion = reactor.initialState.regionArray[row]
                self.regionTextField.text = reactor.initialState.regionArray[row]
                self.regionTextField.resignFirstResponder()
            }
            .disposed(by: disposeBag)
        
        placeTextField.rx.text
            .orEmpty
            .map { String($0.prefix(20)) }
            .asDriver(onErrorJustReturn: "잠시 후 다시 실행해 주세요")
            .drive(placeTextField.rx.text)
            .disposed(by: disposeBag)
        
        placeTextField.rx.text
            .compactMap{ $0 }
            .distinctUntilChanged()
            .map { text in"\(text.count)/20" }
            .asDriver(onErrorJustReturn: "0/20")
            .drive(placeTextLimitedLabel.rx.text)
            .disposed(by: disposeBag)
        
        memoTextField.rx.text
            .orEmpty
            .map { String($0.prefix(25)) }
            .asDriver(onErrorJustReturn: "잠시 후 다시 실행해 주세요")
            .drive(memoTextField.rx.text)
            .disposed(by: disposeBag)
        
        memoTextField.rx.text
            .compactMap{ $0 }
            .distinctUntilChanged()
            .map { text in"\(text.count)/25" }
            .asDriver(onErrorJustReturn: "0/25")
            .drive(placeTextLimitedLabel.rx.text)
            .disposed(by: disposeBag)
        
        Observable.just(reactor.initialState.regionArray)
            .bind(to: regionPickerView.rx.itemTitles) { _, item in
                return item
            }
            .disposed(by: disposeBag)
        
        regionPickerView.rx.itemSelected
            .withUnretained(self)
            .map { owner, index in
                return self.reactor?.initialState.regionArray[index.row]
            }
            .bind(to: regionTextField.rx.text)
            .disposed(by: disposeBag)
        
        // 초기값만 없애는 방법 고려
        datePicker.rx.date
            .map { date in
                reactor.initialState.selectedDate = self.dateFormatter.string(from: date)
                return self.dateFormatter.string(for: date)
            }
            .bind(to: dateTextField.rx.text)
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
    
    // MARK: - Method
    
    private func setUI() {
        view.backgroundColor = .mapBackground
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
    
    // MARK: - Layout
    
    private func setLayout() {
        view.addSubviews(navigationBar, recordScrollView)
        recordScrollView.addSubview(contentView)
        contentView.addSubviews(regionLabel, regionTextField, placeLabel, placeTextLimitedLabel, placeTextField,
                                imageLabel, imageCollectionView, memoLabel, memoTextLimitedLabel, memoTextField,
                                visitedLabel, dateTextField, completeButton)
        
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

extension RecordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == regionTextField {
            return false
        }
        return true
    }
}
