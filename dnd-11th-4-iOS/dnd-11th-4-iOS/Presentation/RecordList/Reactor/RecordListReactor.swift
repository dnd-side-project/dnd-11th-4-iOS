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
        case deleteRecord(IndexPath)
    }
    
    enum Mutation {
        case setRecords([Test])
        case deleteRecord(IndexPath)
    }
    
    struct State {
        var records: [Test] = []
        var deletedIndexPath: IndexPath?
    }
    
    let initialState: State = State()
}

extension RecordListReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadRecords:
            let records = [
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드1", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드2", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드3", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드4", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드5", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드6", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드7", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드8", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드9", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드10", memo: "꾸르잼", date: "24.10.22")
            ]
            return Observable.just(Mutation.setRecords(records))
        case .deleteRecord(let indexPath):
            return Observable.just(Mutation.deleteRecord(indexPath))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setRecords(let record):
            newState.records = record
        case .deleteRecord(let indexPath):
            newState.records.remove(at: indexPath.item)
            newState.deletedIndexPath = indexPath
        }
        
        return newState
    }
}
