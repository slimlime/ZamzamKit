//
//  BackgroundTask.swift
//  https://gist.github.com/phatmann/e96958529cc86ff584a9
//  ZamzamKit
//
//  Created by Basem Emara on 3/15/17.
//  Copyright © 2017 Zamzam. All rights reserved.
//

import UIKit

/// Encapsulate iOS background tasks
class BackgroundTask {
    private let application: UIApplication
    private var identifier = UIBackgroundTaskInvalid
    
    init(application: UIApplication) {
        self.application = application
    }
    
    /// Execute a process with an indefinite background task.
    /// The handler must call `end()` when it is done.
    class func run(for application: UIApplication, handler: (BackgroundTask) -> ()) {
        let backgroundTask = BackgroundTask(application: application)
        backgroundTask.begin()
        handler(backgroundTask)
    }
    
    func begin() {
        self.identifier = application.beginBackgroundTask {
            self.end()
        }
    }
    
    func end() {
        if identifier != UIBackgroundTaskInvalid {
            application.endBackgroundTask(identifier)
        }
        
        identifier = UIBackgroundTaskInvalid
    }
}
