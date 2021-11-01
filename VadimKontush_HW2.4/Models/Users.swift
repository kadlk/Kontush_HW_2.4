//
//  User.swift
//  Vadim.KontushVI_HW2.3
//
//  Created by Vadim Kontush on 31.10.21.
//

import Foundation

class User{
    var name = ""
    var password = ""
    var age = 0
    var info = ""
    
    
    static func getUser() -> User{
        let user:User = User()
        
        user.name = "admin"
        user.password = "123"
        user.age = 32
        user.info = "There should be info about me"
        
        return user
    }
}


