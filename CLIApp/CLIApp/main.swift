//
//  main.swift
//  CLIApp
//
//  Created by Ankit Kumar Bharti on 31/07/18.
//  Copyright © 2018 Exilant. All rights reserved.
//

import Foundation

let panagram = Panagram()
if CommandLine.argc < 2 {
    panagram.interactiveMode()
} else {
    panagram.staticMode()
}

