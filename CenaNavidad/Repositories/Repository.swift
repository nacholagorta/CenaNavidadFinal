

import Foundation
protocol Repository {
    associatedtype T
    func getAll() -> [T]
    func get (identifier: String) -> T?
    func get (name: String) -> T?

    func create(a: T) -> Bool
    func update (a: T) -> Bool
    func delete (a: T) -> Bool
}

