//
//  Persistance.swift
//  AppILQ
//
//  Created by Andrew on 30.01.20.
//  Copyright © 2020 Serg Nepomyaschyy. All rights reserved.
//

import Foundation


protocol PersistingPoetry  {
    var persistence: Persistence { get set}
    var poems: [Poem] { get set }
    func loadDatafromDevice()
}

class Persistence {
    
    enum Files: String {
        case mostRecentlyFetchedPoems
    }
    
    
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData<T: Decodable>(fileName: Files, objects: inout T) {
        let fileName = Persistence.getDocumentsDirectory().appendingPathComponent(fileName.rawValue)
        do {
            let data = try Data(contentsOf: fileName)
            objects = try JSONDecoder().decode(T.self, from: data)
            
        } catch {
            print("Unable to load saved data.")
        }
    }
    static func saveData<T:Encodable>(data: T, _ fileName: Files) {
        do {
            let filename = Persistence.getDocumentsDirectory().appendingPathComponent(fileName.rawValue)
            let data = try JSONEncoder().encode(data)
            try data.write(to: filename, options: [.atomicWrite,.completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
}
