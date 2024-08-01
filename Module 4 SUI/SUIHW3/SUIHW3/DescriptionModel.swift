//
//  descriptionModel.swift
//  SUIHW3
//
//  Created by Игорь Крысин on 26.07.2024.
//

import Foundation

struct DescriptionModel: Identifiable {
    var id: String = UUID().uuidString
    var date: Date
    var comment: String
    
    static func mokeData() -> [DescriptionModel] {
        [
            DescriptionModel(date: Date.now, comment: "kurlyk-kurlyk"),
            DescriptionModel(date: Date.now, comment: "kurlyk-kurlyk-kurlykdsfmdslmfldsmsdklmfl kdsfmfsdlkmfd msdf lmkfdslm lksmfd lkmf sdlmfds lkm"),
            DescriptionModel(date: Date.now, comment: "kurlyk-kurlyk-kurlyk-kurlyk  dsfmf ds;lmf l;sdmf l;dms l;dsmlf lmsdfd,'fdsnjhfbsd"),
        ]
    }
}
