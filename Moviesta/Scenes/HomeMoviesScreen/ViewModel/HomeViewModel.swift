//
//  HomeViewModel.swift
//  Moviesta
//
//  Created by SODA on 22/01/2022.
//

import RxSwift
import RxCocoa
import Alamofire

class HomeViewModel {
    
    let menuData = Observable.just(["Top Rated","Popular","Up Coming","latest"])
    var catogeryPublishSubject = PublishRelay<[Genre]>()
    
    
    func getCatogeryTitls() {
        NetworkCaller.Request(APIRouter.getCatogery) { [weak self] (result:Result<CatogeryModel, Error>) in
            
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.catogeryPublishSubject.accept(response.genres ?? [])
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
