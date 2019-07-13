//
//  JSON.swift
//  GitTrending
//
//  Created by Bala Vino on 12/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    func getObject<T: Codable>(_ item: T.Type, _ value: Data) -> T? {
        do {
            let dataValue = try decode(item, from: value)
            return dataValue
        } catch {
            return nil
        }
    }
    
    func getDataFromFile<T: Codable>(_ fileName: String, _ item: T.Type = T.self) -> T? {
        do {
            guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else { return nil
            }
            
            guard let data = try? Data(contentsOf: url) else {
                return nil
            }
            
            let dataValue  = try decode(item, from: data)
            return dataValue
        } catch {
            return nil
        }
    }
}
