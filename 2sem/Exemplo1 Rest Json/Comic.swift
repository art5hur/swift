//
//  Comic.swift
//  Exemplo1 Rest Json
//
//  Created by Usuário Convidado on 04/09/25.
//

import Foundation

struct Comic:Decodable{
    var num:Int
    var day:String
    var month:String
    var year:String
    var title:String
    var img:String
            
    
}
