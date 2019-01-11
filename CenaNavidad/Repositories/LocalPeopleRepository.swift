
import UIKit
import RealmSwift

class LocalPeopleRepository: NSObject {
    
    func getAll() -> [Participantes] {
        var tasks : [Participantes] = []
        do {
            let entities = try Realm().objects(Entity.self).sorted(byKeyPath: "date", ascending: true)
            for entity in entities {
                let model = entity.taskModel()
                tasks.append(model)
            }
        }
        catch let error as NSError {
            print("Error en el getAll Tasks:", error.description)
        }
        return tasks
    }
    func get(identifier: String) -> Participantes? {
        
        do{
            let realm = try Realm()
            if let entity = realm.objects(Entity.self).filter("id == %@",identifier).first{
                let model = entity.taskModel()
                return model
            }
        }
        catch {
            return nil
        }
        return nil
    }
    func get(name: String) -> Participantes? {
        
        do{
            let realm = try Realm()
            if let entity = realm.objects(Entity.self).filter("name == %@",name).first{
                let model = entity.taskModel()
                return model
            }
        }
        catch {
            return nil
        }
        return nil
    }
    func create(a: Participantes) -> Bool {
        do {
            let realm = try Realm()
            let entities = Entity(people: a)
            try realm.write {
                realm.add(entities,update: true)
            }
        }
        catch {
            return false
        }
        return true
    }
    func update(a: Participantes) -> Bool {
        return create(a: a)
    }
    
    func delete(a: Participantes) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                let entitiyDelete = realm.objects(Entity.self).filter("id == %@", a.id)
                realm.delete(entitiyDelete)
            }
        }
        catch{
            return false
        }
        return true
    }
    
}
