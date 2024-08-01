import Foundation
import RealmSwift

struct WorkModel: Identifiable {
    var id: String = UUID().uuidString
    var captionName: String
    var descriptionName: String
    var image: String?
    
    
    static func mokeData() -> [WorkModel] {
        []
    }
}

class NoteModel: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var captionName: String = ""
    @Persisted var descriptionName: String = ""
    @Persisted var image: String = ""
}
