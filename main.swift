//
//  main.swift
//  documentDB
//
//  Created by Użytkownik Gość on 23/03/2022.
//  Copyright © 2022 Użytkownik Gość. All rights reserved.
//

import Foundation



var documents = [UUID: Document]()
var tags = [UUID: Set<UUID>]()

var Tag1 = Tag(shortName: "programming")
var Tag2 = Tag(shortName: "swift")
var Tag3 = Tag(shortName: "pdf")
var Tag4 = Tag(shortName: "database")
var Tag5 = Tag(shortName: "nosql")



var Document1 = Document(path: "/doc/books/apple",suma: [ChSum.md5: "md5CheckSum",ChSum.sha1: "sha1CheckSum"],tags: [Tag1.uuid, Tag2.uuid, Tag3.uuid])

var Document2 = Document(path: "/doc/books/databases/nosql", suma: [ChSum.md5: "md5CheckSum2",ChSum.sha1: "sh1CheckSum2"], tags: [Tag3.uuid, Tag4.uuid, Tag5.uuid])

documents[Document1.uuid] = Document1
documents[Document2.uuid] = Document2

tags = [
    Tag1.uuid: [Document1.uuid],
    Tag2.uuid: [Document1.uuid],
    Tag3.uuid: [Document1.uuid, Document2.uuid],
    Tag4.uuid: [Document2.uuid],
    Tag5.uuid: [Document2.uuid]
]

printer(db: documents,tags: tags)

