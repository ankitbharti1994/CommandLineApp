//
//  ConsoleIO.swift
//  CLIApp
//
//  Created by Ankit Kumar Bharti on 31/07/18.
//  Copyright © 2018 Exilant. All rights reserved.
//

import Foundation

enum OutputType {
    case standard
    case error
}

class ConsoleIO {
    func write(_ message: String, to : OutputType = .standard) {
        switch to {
        case .standard:
            print("\u{001B}[;m\(message)")
        case .error:
            fputs("\u{001B}[0;31m\(message)\n", stderr)
        }
    }
    
    func getInput() -> String {
        let keyboardInput = FileHandle.standardInput
        let data = keyboardInput.availableData
        let string = String(data: data, encoding: .utf8)
        return string!.trimmingCharacters(in: .newlines)
    }
    
    func printUsages() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        write("usages:-")
        write("\(executableName) -a string1 string2")
        write("or")
        write("\(executableName) -p string")
        write("or")
        write("\(executableName) -h to show usage information")
        write("Type \(executableName) without an option to enter interactive mode.")
    }
}
