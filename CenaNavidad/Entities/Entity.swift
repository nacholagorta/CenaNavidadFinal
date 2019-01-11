

import Foundation
import RealmSwift

class Entity: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var isDone = false
    @objc dynamic var date = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    convenience init (people: Participantes)
    {
        self.init()
        self.id = people.id
        self.name = people.name
        self.isDone = people.isDone
        self.date = people.date!
    }
    func taskModel() -> Participantes{
        let model = Participantes()
        model.id = self.id
        model.name = self.name
        model.isDone = self.isDone
        model.date = self.date
        return model
    }
}
