//
//  RecordReactor.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/14/24.
//

import Foundation
import ReactorKit

final class RecordReactor: Reactor {
    
    var initialState: State
    
    enum Action {
        case imageAddTapped([NSItemProvider])
    }
    
    enum Mutation {
        case setImageArray([UIImage])
    }
    
    struct State {
        let regionArray = ["서울", "경기도", "인천", "강원도", "충청북도", "충청남도", "대전", "경상북도",
                           "경상남도", "대구", "울산", "부산", "전라북도", "전라남도", "광주", "제주도"]
        var selectedRegion = "서울"
        var selectedDate: String? = nil
        var selectedArrayImage: [UIImage]?
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .imageAddTapped(let imageArray):
            return self.setImageArray(imageArray).map { Mutation.setImageArray($0) }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setImageArray(let imageArray):
            newState.selectedArrayImage = imageArray
        }
        return newState
    }
}

extension RecordReactor {
    private func setImageArray(_ itemProviders: [NSItemProvider]) -> Observable<[UIImage]> {
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
}
