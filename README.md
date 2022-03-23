# swiftFileBase

## Requirements
Define class <i>Document</i> to store basic information about one document:

```
class Document: {
  uuid: UUID - universally unique identifier
  path: String - path to the document
  checksum: - dictionary of the form ["checksumName1": "checksumValue1", ...]
  tags: set of tag uuids
  meta: meta object with additional informations (optional)
}
```
Define class Tag to store basic information about tag:
```
class Tag: {
  uuid: UUID - universally unique identifier
  shortName: one word string
  longName: String (optional)
  description: String (optional)
}
```
Define class Meta to store additional (and optional) informatio related to documents:
```
class Meta: {
  description: String
}
```
Create structures to save all data:
Dictionary:
```
  documents ["document_uuid_as_a_string": document_object, ...]
  tags ["tag_uuid": set_of_document_uuids, ...]
```
When it makes sense, try to use different propoerty types.
## Example
Document 1: <br>
<i>Book of title "Learn Swift by examples. Beginner level" by Piotr Fulmański <br>
Topics: programming, swift <br>
Other: format pdf </i> <br>
<br><br>
Document 2:<br>
<i> Book of title "NoSQL. Theory and examples" by Piotr Fulmański<br>
Topics: database, nosql<br>
Other: format pdf<br> </i>


### First, create obejcts to represent all tags


Tags
```
{
  uuid: "tagUUID1"
  shortName: "programming"
  longName: nil
  description: nil
}

{
  uuid: "tagUUID2"
  shortName: "swift"
  longName: nil
  description: nil
}

{
  uuid: "tagUUID3"
  shortName: "pdf"
  longName: nil
  description: nil
}

{
  uuid: "tagUUID4"
  shortName: "database"
  longName: nil
  description: nil
}

{
  uuid: "tagUUID5"
  shortName: "nosql"
  longName: nil
  description: nil
}
```

### Having tags, you can create object to represent you documents
 
 
Document object for Document 1:
```
document1 = {
  uuid: UUID = "documentUUID1"
  path: String = "/doc/books/apple"
  checksum: Dictionary = ["md5": "md5ChecksumValue1", "sha1": "sha1ChecksumValue1"]
  tags: Set = ["tagUUID1", "tagUUID2", "tagUUID3"]
  meta: nil
}
```
Document object for Document 2:
```
document2 = {
  uuid: UUID = "documentUUID2"
  path: String = "/doc/books/databases/nosql"
  checksum: Dictionary = ["md5": "md5ChecksumValue2", "sha1": "sha1ChecksumValue2"]
  tags: Set = ["tagUUID4", "tagUUID5", "tagUUID3"]
  meta: nil
}
```


### Save informations about documents in data structures

```
documents: Dictionary = ["documentUUID1": document1, "documentUUID2": document2]
tags: Dictionary =
[
  "tagUUID1": Set = ["documentUUID1"],
  "tagUUID2": Set = ["documentUUID1"],
  "tagUUID3": Set = ["documentUUID1", "documentUUID3"],
  "tagUUID4": Set = ["documentUUID2"],
  "tagUUID5": Set = ["documentUUID2"]
]
```
