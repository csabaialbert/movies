//
//  Movie.swift
//  Movies
//
//  Created by Kovács Márk on 2022. 11. 12..
//

import Foundation

class Movie {
    var id: NSUUID
    var title: String
    var year: Int
    var image: String
    
    init(_ title: String,_ year: Int,_ image: String) {
        self.id = NSUUID()
        self.title = title
        self.year = year
        self.image = image
    }
}
