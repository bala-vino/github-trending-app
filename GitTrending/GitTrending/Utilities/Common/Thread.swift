//
//  Thread.swift
//  GitTrending
//
//  Created by Bala Vino on 12/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    static func runInMainSync(execute block: () -> Void) {
        DispatchQueue.main.sync {
            block()
        }
    }
    
    static func runInMainAsync(execute block: @escaping () -> Void) {
        DispatchQueue.main.async {
            block()
        }
    }
    
    static func runInMainAsyncAfter(delay: Double, block: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
            block()
        })
    }
    
    static func runInBackground(block: @escaping () -> Void, completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            block()
            
            runInMainSync {
                completion()
            }
        }
    }
    
    static func runInBackgroundAfter(delay: Double, block: @escaping () -> Void, completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            block()
            runInMainAsyncAfter(delay: delay) {
                completion()
            }
        }
    }
}
