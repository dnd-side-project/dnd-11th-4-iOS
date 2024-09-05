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
        case viewWillAppear(RecordType)
        case imageAddTapped([NSItemProvider])
        case regionTapped(String)
        case placeTapped(String)
        case memoTapped(String)
        case dateTapped(Date)
        case deleteCellTapped(IndexPath)
    }
    
    enum Mutation {
        case setRecordData(DetailRecordAppData)
        case setImageArray([UIImage])
        case setRegionText(String)
        case setPlaceText(String)
        case setMemoText(String)
        case setDateText(String)
        case setDeleteCell([UIImage])
    }
    
    struct State {
        let regionArray = ["서울", "경기도", "인천", "강원도", "충청북도", "충청남도", "대전", "경상북도",
                           "경상남도", "대구", "울산", "부산", "전라북도", "전라남도", "광주", "제주도"]
        var selectedRegion: String?
        var selectedDate: String? = DateFormatter().string(from: Date())
        var selectedArrayImage: [UIImage]?
        var placeText: String?
        var memoText: String? = ""
        var imageCount: Int = 0
        var completeButtonEnabled: Bool {
            return selectedRegion != nil && placeText != ""
        }
        var recordData: DetailRecordAppData?
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear(let type):
            return Observable.just(.setRecordData(prepareTypeData(type: type)))
        case .imageAddTapped(let imageArray):
            return self.prepareImageArray(imageArray).map { array in
                self.initialState.selectedArrayImage = array
                return Mutation.setImageArray(array)
            }
        case .regionTapped(let regionText):
            return Observable.just(.setRegionText(regionText))
        case .placeTapped(let placeText):
            return Observable.just(.setPlaceText(prepareTrimText(placeText, 20)))
        case .memoTapped(let memoText):
            return Observable.just(.setMemoText(prepareTrimText(memoText, 25)))
        case .dateTapped(let date):
            return Observable.just(.setDateText(prepareDateText(date)))
        case .deleteCellTapped(let indexPath):
            return Observable.just(.setDeleteCell(prepareDeleteCell(indexPath)))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setRecordData(let data):
            newState.selectedRegion = data.region
            newState.placeText = data.place
            newState.memoText = data.memo
            newState.selectedDate = data.date
            newState.selectedArrayImage = data.imageArray
        case .setImageArray(let imageArray), .setDeleteCell(let imageArray):
            newState.selectedArrayImage = imageArray
            newState.imageCount = imageArray.count
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
    
    private func prepareDeleteCell(_ indexPath: IndexPath)-> [UIImage] {
        let row = indexPath.item
        initialState.selectedArrayImage?.remove(at: row)
        return initialState.selectedArrayImage ?? []
    }
    
    private func prepareTypeData(type: RecordType) -> DetailRecordAppData {
        switch type {
        case .write(let region):
            initialState.recordData?.region = region
        case .edit(let data):
            if data.imageArray[0] == Constant.Image.imageDetailEmpty {
                initialState.recordData = data
                initialState.recordData?.imageArray = []
            }
        }
        return initialState.recordData ?? DetailRecordAppData.empty
    }
}
