//
//  AGSwift.swift
//  fitsmeright
//
//  Created by Lynn Park on 25/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



class AGSwift {
  
  //MARK: - Implement
  
  
  
  //MARK: - Public
  static func setMockUser() {
    UserDefaults.FSUserDefault.set(data: getMockUser())
    UserDefaults.LoggedIn.set(data: true)
  }
  
  static func getMockUser() -> FSUser {
    let fsUser = FSUser()
    fsUser.documentId = "N5GUixP95dAMKzXBx5kG"
    fsUser.email = "lhin-ping@hotmail.com"
    fsUser.username = "lin999"
    fsUser.displayName = "linping"
    fsUser.password = "1234"
    fsUser.bio = "hi it's me"
    fsUser.image = "https://scontent.fbkk2-4.fna.fbcdn.net/v/t1.0-9/45161922_2339782596063074_4119251589691080704_n.jpg?_nc_cat=100&_nc_eui2=AeG43exfG0s2335H6-lY2CU72YSv9lwz2K5pHM-UHi-RWIUchf0bRi6qE4FxT7KV1ah7D77xpYQn3ylR7BUXlrjZFuw8VW8G0ZokQ-h1Ske_sg&_nc_ht=scontent.fbkk2-4.fna&oh=634a665815517496e690796dd17c3e3a&oe=5D17E30C"
    return fsUser
  }
  
  
  
  //MARK: - Private
  
  
  
}
