//
//  CategoriesViewModel.swift
//  Mandiri
//
//

import Foundation

class CategoriesViewModel {
    
    let apiHelper = ApiHelper()
    
    func postListCategories(apiKey: String,kategori: String,language:String,
                     onSuccess: @escaping ([NewsCategories]) -> Void,
                     onError: @escaping (String) -> Void,
                     onFailed: @escaping (String) -> Void) {
        apiHelper.postRequestList(
            url: Constants.BASE_URL+Constants.TOP_HEADLINES+"?apiKey=\(apiKey)&kategori=\(kategori)&language=\(language)",
            body: ["":""],
            onSuccess: { response in onSuccess(response) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)") }
        )
    }
}
    
