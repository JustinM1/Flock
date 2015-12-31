//
//  Flock.swift
//  Flock
//
//  Created by Jake Heiser on 12/28/15.
//  Copyright © 2015 jakeheis. All rights reserved.
//

import SwiftCLI

public class Flock {
  
    static var groups: [Group] = []
    
    static let Default: [Group] = [Flock.Deploy]
  
    // MARK: - Public
    
    public static func use(group: Group) {
        groups.append(group)
    }
    
    public static func use(groups: [Group]) {
        self.groups += groups
    }
    
    public static func run() {
      CLI.setup(name: "flock", version: "0.0.1", description: "Flock: Automated deployment of your Swift app")
      CLI.registerCommands(buildCommands())
      CLI.go()
    }
    
    // MARK: - Internal
    
    static func buildCommands() -> [CommandType] {
      return groups.map { $0.toCommand() }
    }
    
}
