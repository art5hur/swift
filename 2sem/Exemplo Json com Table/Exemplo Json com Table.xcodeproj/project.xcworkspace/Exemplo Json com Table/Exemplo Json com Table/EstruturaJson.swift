//
//  EstruturaJson.swift
//  Exemplo Json com Table
//
//  Created by Usuário Convidado on 25/09/25.
//

import Foundation

struct App:Decodable{
    var feed:Feed
}

struct Feed:Decodable{
    var entry:[Entry]
}

struct Entry:Decodable{
    var name:Name
    enum CodingKeys:String,CodingKey{
        case name = "im:name"
    }
}

struct Name:Decodable{
    var label:String
}
