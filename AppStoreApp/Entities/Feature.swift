//
//  Feature.swift
//  AppStoreApp
//
//  Created by David Yoon on 2021/12/15.
//

import UIKit


struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
    
    
    var image: URL? {
        return URL(string:imageURL) ?? nil
    }
}
