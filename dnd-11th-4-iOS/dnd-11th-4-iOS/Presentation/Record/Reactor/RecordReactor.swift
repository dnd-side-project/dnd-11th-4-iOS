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

struct RecordModel {
    let type: RecordType
    let region: String
    let place: String?
    let imageArray: [UIImage]?
    let memo: String?
    let date: String
}

final class RecordReactor: Reactor {
    
    var initialState: State
    
    enum Action {
        case viewWillAppear(RecordModel)
        case imageAddTapped([NSItemProvider])
        case regionTapped(String)
        case placeTapped(String)
        case memoTapped(String)
        case dateTapped(Date)
        case deleteCellTapped(IndexPath)
        case completeButtonTapped
    }
    
    enum Mutation {
        case setImageArray([UIImage])
        case setRegionText(String)
        case setPlaceText(String)
        case setMemoText(String)
        case setDateText(Date)
        case setDeleteCell(IndexPath)
        case completeAPI(Bool)
        case setError(MDError)
    }
    
    struct State {
        let regionArray = ["서울", "경기도", "인천", "강원도", "충청북도", "충청남도", "대전", "경상북도",
                           "경상남도", "대구", "울산", "부산", "전라북도", "전라남도", "광주", "제주도"]
        var selectedRegion = "서울"
        var selectedBeforeDate = Date()
        var selectedAfterDate = String()
        var selectedServerDate = String()
        var selectedArrayImage: [UIImage] = []
        var placeText = ""
        var memoText = ""
        var imageCount: Int = 0
        var recordData: DetailRecordAppData?
        var recordModel: RecordModel
        var completedAPI: Bool?
        var completeButtonEnabled: Bool {
            return selectedRegion != "" && placeText != ""
        }
    }
    
    init(model: RecordModel) {
        self.initialState = State(recordModel: model)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear(let model):
            return Observable.concat([
                Observable.just(.setRegionText(model.region)),
                Observable.just(.setPlaceText(prepareTrimText(model.place, 20))),
                Observable.just(.setMemoText(prepareTrimText(model.memo ?? "", 25))),
                Observable.just(.setDateText(currentState.selectedBeforeDate))
            ])
        case .imageAddTapped(let imageArray):
            return self.prepareImageArray(imageArray).map { array in
                return Mutation.setImageArray(array)
            }
        case .regionTapped(let regionText):
            return Observable.just(.setRegionText(regionText))
        case .placeTapped(let placeText):
            return Observable.just(.setPlaceText(prepareTrimText(placeText, 20)))
        case .memoTapped(let memoText):
            return Observable.just(.setMemoText(prepareTrimText(memoText, 25)))
        case .dateTapped(let date):
            return Observable.just(.setDateText(date))
        case .deleteCellTapped(let indexPath):
            return Observable.just(.setDeleteCell(indexPath))
        case .completeButtonTapped:
            return RecordService.postRecordAPI(request: RecordRequest(recordRequest: Record(region: currentState.selectedRegion,
                                                                                            attractionName: currentState.placeText,
                                                                                            memo: currentState.memoText,
                                                                                            localDate: currentState.selectedServerDate)),
                                                                      photos: RecordPhotos(photos: currentState.selectedArrayImage))
                .map { response in
                    return Mutation.completeAPI(true)
                }
                .catch { error in
                    return Observable.just(Mutation.setError(NetworkManager.handleError(error)))
                }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setImageArray(let imageArray):
            newState.selectedArrayImage = imageArray
            newState.imageCount = imageArray.count
        case .setDeleteCell(let indexPath):
            newState.selectedArrayImage.remove(at: indexPath.row)
            newState.imageCount = newState.selectedArrayImage.count
        case .setRegionText(let regionText):
            newState.selectedRegion = regionText
        case .setPlaceText(let placeText):
            newState.placeText = placeText
        case .setMemoText(let memoText):
            newState.memoText = memoText
        case .setDateText(let dateText):
            newState.selectedServerDate = prepareServerDataText(dateText)
            newState.selectedAfterDate = prepareClientDateText(dateText)
        case .completeAPI(let state):
            newState.completedAPI = state
        case .setError(let error):
            print(error)
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
    
    private func prepareTrimText(_ text: String?, _ count: Int) -> String {
        guard let text = text else { return "" }
        return text.count > count ? String(text.prefix(count)) : text
    }
    
    private func prepareClientDateText(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dateFormatter.string(from: date)
    }
    
    private func prepareServerDataText(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    private func prepareTypeData(type: RecordType) -> DetailRecordAppData {
//        switch type {
//        case .write:
//            initialState.recordData?.region = region
//        case .edit:
//            if data.imageArray[0] == Constant.Image.imageDetailEmpty {
//                initialState.recordData = data
//                initialState.recordData?.imageArray = []
//            }
//        }
        return initialState.recordData ?? DetailRecordAppData.empty
    }
}
