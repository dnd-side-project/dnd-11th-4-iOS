//
//  RecordReactor.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/14/24.
//

import Foundation
import ReactorKit

enum DateButtonType {
    case cancel
    case complete
}

enum RegionButtonType {
    case cancel
    case complete(Int)
}

final class RecordReactor: Reactor {
    
    var initialState: State
    
    enum Action {
        case imageAddTapped([NSItemProvider])
        case regionTapped(String)
        case placeTapped(String)
        case memoTapped(String)
        case dateTapped(Date)
    }
    
    enum Mutation {
        case setImageArray([UIImage])
        case setRegionText(String)
        case setPlaceText(String)
        case setMemoText(String)
        case setDateText(String)
    }
    
    struct State {
        let regionArray = ["서울", "경기도", "인천", "강원도", "충청북도", "충청남도", "대전", "경상북도",
                           "경상남도", "대구", "울산", "부산", "전라북도", "전라남도", "광주", "제주도"]
        var selectedRegion = "서울"
        var selectedDate: String? = DateFormatter().string(from: Date())
        var selectedArrayImage: [UIImage]?
        var placeText: String?
        var memoText: String? = ""
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .imageAddTapped(let imageArray):
            return self.prepareImageArray(imageArray).map { Mutation.setImageArray($0) }
        case .regionTapped(let regionText):
            return Observable.just(.setRegionText(regionText))
        case .placeTapped(let placeText):
            return Observable.just(.setPlaceText(prepareTrimText(placeText, 20)))
        case .memoTapped(let memoText):
            return Observable.just(.setMemoText(prepareTrimText(memoText, 25)))
        case .dateTapped(let date):
            return Observable.just(.setDateText(prepareDateText(date)))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setImageArray(let imageArray):
            newState.selectedArrayImage = imageArray
        case .setRegionText(let regionText):
            newState.selectedRegion = regionText
        case .setPlaceText(let placeText):
            newState.placeText = placeText
        case .setMemoText(let memoText):
            newState.memoText = memoText
        case .setDateText(let dateText):
            newState.selectedDate = dateText
        }
        return newState
    }
}

extension RecordReactor {
    private func prepareImageArray(_ itemProviders: [NSItemProvider]) -> Observable<[UIImage]> {
        let observables = itemProviders.compactMap { itemProvider -> Observable<UIImage> in
            guard itemProvider.canLoadObject(ofClass: UIImage.self) else {
                return Observable.empty() // 이미지가 로드될 수 없는 경우 빈 Observable 반환
            }
            
            return Observable.create { observer in
                itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let loadedImage = image as? UIImage {
                        observer.onNext(loadedImage)
                    } else {
                        observer.onError(NSError(domain: "ImageLoadError", code: 0, userInfo: nil))
                    }
                }
                return Disposables.create()
            }
        }
        
        return Observable.zip(observables)
    }
    
    private func prepareTrimText(_ text: String, _ count: Int) -> String {
        return text.count > count ? String(text.prefix(count)) : text
    }
    
    private func prepareDateText(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        initialState.selectedDate = dateFormatter.string(from: date)
        return dateFormatter.string(from: date)
    }
}
