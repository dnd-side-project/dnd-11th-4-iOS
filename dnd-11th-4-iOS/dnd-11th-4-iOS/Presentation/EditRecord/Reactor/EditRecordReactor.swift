//
//  EditRecordReactor.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 10/17/24.
//

import ReactorKit
import Kingfisher

struct EditRecordModel {
    let id: Int
    let region: String
    let place: String?
    let imageArray: [String]?
    let memo: String?
    let date: String?
}

final class EditRecordReactor: Reactor {
    
    var initialState: State
    
    enum Action {
        case viewWillAppear
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
        var recordData: RecordResponse?
        var recordModel: RecordResponse
        var completedAPI: Bool?
        var completeButtonEnabled: Bool {
            return selectedRegion != "" && placeText != ""
        }
    }
    
    init(model: RecordResponse) {
        self.initialState = State(recordModel: model)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            return Observable.concat([
                Observable.just(.setRegionText(currentState.recordModel.region)),
                Observable.just(.setPlaceText(prepareTrimText(currentState.recordModel.attractionName, 20))),
                Observable.just(.setMemoText(prepareTrimText(currentState.recordModel.memo ?? "", 25))),
                Observable.just(.setDateText(Date())),
                prepareUrlImageArray(currentState.recordModel.photoUrls).map { array in
                    Mutation.setImageArray(array)
                }
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
            return RecordService.updateRecordAPI(request: RecordRequest(recordRequest: Record(region: currentState.selectedRegion,
                                                                                              attractionName: currentState.placeText,
                                                                                              memo: currentState.memoText,
                                                                                              localDate: currentState.selectedServerDate)),
                                                 photos: RecordPhotos(photos: currentState.selectedArrayImage), id: RecordId(id: currentState.recordModel.id))
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

extension EditRecordReactor {
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
    
    func prepareUrlImageArray(_ urls: [String]?) -> Observable<[UIImage]> {
        guard let urls = urls, !urls.isEmpty else {
            return Observable.just([])  // 빈 배열 반환
        }
        
        // 각 URL에 대해 비동기적으로 이미지를 다운로드하여 배열로 반환
        return Observable.from(urls)
            .flatMap { url -> Observable<UIImage> in
                return Observable.create { observer in
                    guard let url = URL(string: url) else {
                        observer.onCompleted()
                        return Disposables.create()
                    }
                    
                    let task = URLSession.shared.dataTask(with: url) { data, _, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        if let data = data, let image = UIImage(data: data) {
                            observer.onNext(image)
                        }
                        observer.onCompleted()
                    }
                    task.resume()
                    
                    return Disposables.create {
                        task.cancel()
                    }
                }
            }
            .toArray()
            .asObservable()
    }
}
