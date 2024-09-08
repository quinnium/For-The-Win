//
//  DatabaseManager.swift
//  ForTheWin
//
//  Created by Quinn on 05/09/2024.
//

import Foundation
import RealmSwift

@MainActor
class DatabaseManager {
    
    private var realm: Realm
    
    init() {
        var configuration: Realm.Configuration
        configuration = Realm.Configuration.defaultConfiguration
        if configuration.fileURL != nil {
            configuration.fileURL!.deleteLastPathComponent()
            configuration.fileURL!.append(path: "FTW")
            configuration.fileURL!.appendPathExtension("realm")
            configuration.deleteRealmIfMigrationNeeded = true
        }
        do {
            realm = try Realm(configuration: configuration)
        } catch {
            fatalError("failed to load Realm with configuration \(error)")
        }
    }
    
    func fetchDraws() -> [Draw]? {
        let draws = realm.objects(Draw.self)
        return draws.isEmpty ? nil : Array(draws)
    }
    
    func saveDraws(_ draws: [Draw]) {
        realm.beginWrite()
        for draw in draws {
            realm.add(draw)
        }
        commitChanges()
    }
    
    private func commitChanges() {
        do {
            try realm.commitWrite()
        } catch {
            print("Failed to commit changes to database: \(error)")
        }
    }
    
}
