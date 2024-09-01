//
//  RecordListReactor.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/7/24.
//

import UIKit
import ReactorKit
import RxSwift

final class RecordListReactor: Reactor {
    enum Action {
        case loadRecords
    }
    
    enum Mutation {
        case setRecords([Test])
    }
    
    struct State {
        var records: [Test] = []
        var detailRecords: [DetailRecordAppData] = [DetailRecordAppData(imageArray: [Constant.Image.imageDetailEmpty!,
                                                                                     Constant.Image.imageDetailEmpty!],
                                                                      region: "전라남도",
                                                                      place: "보성 녹차밭",
                                                                      memo: "녹차좋아",
                                                                      date: "24.10.22")]
    }
    
    let initialState: State = State()
}

extension RecordListReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadRecords:
            let records = [
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22")
            ]
            return Observable.just(Mutation.setRecords(records))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setRecords(let record):
            newState.records = record
        }
        
        return newState
    }
}
