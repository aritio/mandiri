//
//  ArtikelViewModel.swift
//  Mandiri
//
//

import Foundation
class ArtikelViewModel {
    
    let apiHelper = ApiHelper()
    
    func postListArtikel(apiKey: String,sources: String,q: String,
                     onSuccess: @escaping ([NewsArtikel]) -> Void,
                     onError: @escaping (String) -> Void,
                     onFailed: @escaping (String) -> Void) {
        apiHelper.postRequestList(
            url: Constants.BASE_URL+Constants.TOP_ARTIKEL+"?apiKey=\(apiKey)&sources=\(sources)&q=\(q)",
            body: ["":""],
            onSuccess: { response in onSuccess(response) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)") }
        )
    }
}
    
