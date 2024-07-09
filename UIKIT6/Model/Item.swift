//
//  Item.swift
//  UIKIT6
//
//  Created by Даниил Сивожелезов on 09.07.2024.
//

import Foundation

struct Item: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let description: String
    let mainImage: String
    let photos: [String]
    
    static func mockObject() -> [Item] {
        [Item(title: "Имя Фамилия", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt", mainImage: "img1", photos: ["img2", "img3", "img4"]),
         Item(title: "Имя Фамилия 2", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt", mainImage: "img5", photos: ["img6", "img7", "img8"]),
         Item(title: "Имя Фамилия 3", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt", mainImage: "img9", photos: ["img10", "img11", "img12"])]
    }
}
