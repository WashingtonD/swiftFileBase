//
//  dataBase.swift
//  documentDB
//
//  Created by Użytkownik Gość on 23/03/2022.
//  Copyright © 2022 Użytkownik Gość. All rights reserved.
//

import Foundation

enum ChSum{
    case md5,sha1
}

class Document{
    let uuid: UUID
    var path: String
    var checksum = [ChSum: String]()
    var tags: Set<UUID>
    var meta: Meta?

    init(path: String, suma: [ChSum: String], tags: Set<UUID>, meta: Meta? = nil){
        self.uuid = UUID()
        self.path = path
        self.checksum = suma
        self.tags = tags
        self.meta = meta
    }
    
}

class Tag{
    let uuid: UUID
    var shortName: String
    var longName: String?
    var description: String?
    
    init(shortName: String, longName: String = "", desc:String = ""){
        self.uuid = UUID()
        self.shortName = shortName
        self.longName = longName
        self.description = desc
    }
    
    
}

class Meta{
    var description: String
    
    init(desc: String){
        self.description = desc
    }
}


func printer(db: [UUID: Document], tags: [UUID: Set<UUID>]){
    var longString: String
    var tagNames = [String]()
    var closing: String
    
    for doc in db{
        tagNames.removeAll(keepingCapacity: false)
        for key in tags.keys{
            if(doc.value.tags.contains(key)){
                tagNames.append(key.uuidString)
            }
        }
         closing = ""
        for _ in 1...(18 + doc.key.uuidString.count){
            closing += "#"
        }
        
        
        
        longString = """
        #########\(doc.key.uuidString)#########
        Path: \(doc.value.path)
        Tags: \(tagNames)
        Check Sum: \(doc.value.checksum)
        Meta: \(String(describing: doc.value.meta))
        \(closing)
"""
        print(longString)
    }
}
