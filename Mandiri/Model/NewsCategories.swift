//
//  NewsCategories.swift
//
//

import Foundation

struct NewsCategories: Codable {
    
    let id: String?
    let name: String?
    let description: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case url
        case category
        case language
        case country
    }
}

/*
 {
 "id_iom": "43",
 "nomor": "001/XI/2020",
 "perihal": "test",
 "approve": "obet",
 "status": "T",
 "status_email": "T",
 "kordinasi": "T"
 }
 */
