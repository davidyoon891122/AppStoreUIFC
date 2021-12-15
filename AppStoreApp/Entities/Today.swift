//
//  Today.swift
//  AppStoreApp
//
//  Created by David Yoon on 2021/12/15.
//

import UIKit


struct Today: Decodable {
    let title: String
    let subTitle: String
    let description: String
    let imageURL: String
    
    
    var image: URL? {
        return URL(string: imageURL) ?? nil
    }
}
