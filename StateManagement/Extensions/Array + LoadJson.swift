//
//  Array + LoadJson.swift
//  StateManagement
//
//  Created by Naresh Banavath on 22/04/24.
//

import Foundation
extension Array where Element : Decodable {
    static func loadFromJson(_ fileName : String) -> [Element]? {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("Error at fileURL")
            return nil }
        guard let data = try? Data(contentsOf: fileURL) else { print("Error at data contents"); return nil }
        do {
            let elementList = try JSONDecoder().decode([Element].self, from: data)
            return elementList
        }catch let err {
            debugPrint(err.localizedDescription)
        }
        return nil
       
        
    }
}
