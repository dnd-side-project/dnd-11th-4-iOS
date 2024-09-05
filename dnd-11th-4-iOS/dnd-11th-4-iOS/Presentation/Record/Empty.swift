//
//  Empty.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/27/24.
//

import Foundation

//reactor.state.compactMap { $0.dateState }
//    .skip(1)
//    .asDriver(onErrorJustReturn: "2024년 08월 27일")
//    .drive(with: self, onNext: { owner, text in
//        print(text)
//        owner.dateTextField.text = text
//        owner.dateTextField.resignFirstResponder()
//    })
//    .disposed(by: disposeBag)
//
//dateCancelBarButton.rx.tap
//    .map { Reactor.Action.dateBarTapped(.cancel) }
//    .bind(to: reactor!.action)
//    .disposed(by: disposeBag)
//
//dateComplteBarButton.rx.tap
//    .map { Reactor.Action.dateBarTapped(.complete) }
//    .bind(to: reactor!.action)
//    .disposed(by: disposeBag)

//case dateBarTapped(DateButtonType)
//case setDateState(String?)
//
//private func prepareDateState(_ type: DateButtonType) -> String? {
//    return type == DateButtonType.cancel ? nil : "오늘날짜"
//}

//regionCancelBarButton.rx.tap
//    .map { Reactor.Action.regionBarButtonTapped(.cancel) }
//    .bind(to: reactor.action)
//    .disposed(by: disposeBag)
//
//regionComplteBarButton.rx.tap
//    .map {
//        let row = self.regionPickerView.selectedRow(inComponent: 0)
//        return Reactor.Action.regionBarButtonTapped(.complete(row))
//    }
//    .bind(to: reactor.action)
//    .disposed(by: disposeBag)
//
//reactor.state.compactMap { $0.regionButtonState }
//    .observe(on: MainScheduler.asyncInstance)
//    .asDriver(onErrorJustReturn: "2024년 08월 27일")
//    .drive(with: self, onNext: { owner, text in
//        owner.regionTextField.text = text
//        owner.regionTextField.resignFirstResponder()
//    })
//    .disposed(by: disposeBag)

//enum RegionButtonType: Equatable {
//    case cancel
//    case complete(Int)
//}

//private func prepareRegionState(_ type: RegionButtonType) -> String {
//    switch type {
//    case .complete(let row):
////            initialState.selectedRegion = initialState.regionArray[row]
//        return initialState.regionArray[row]
//    case .cancel:
//        return initialState.selectedRegion
//    }
//}
//case regionBarButtonTapped(RegionButtonType)
//case setRegionButtonState(String)
//}
