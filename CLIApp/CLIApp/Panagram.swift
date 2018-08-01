//
//  Panagram.swift
//  CLIApp
//
//  Created by Ankit Kumar Bharti on 31/07/18.
//  Copyright © 2018 Exilant. All rights reserved.
//

import Foundation

enum OptionType: String {
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
            case "a": self = .anagram
            case "p": self = .palindrome
            case "h": self = .help
            case "q": self = .quit
            default: self = .unknown
        }
    }
}


class Panagram {
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        let argCount = CommandLine.argc
        let argument = CommandLine.arguments[1]
        let (option, value) = getOption(String(argument[argument.index(after: argument.startIndex)]))
        
        switch option {
        case .anagram:
            if argCount != 4 {
                if argCount > 4 {
                    consoleIO.write("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.write("Too few arguments for option \(option.rawValue)", to: .error)
                }
                consoleIO.printUsages()
            } else {
                let first = CommandLine.arguments[2]
                let second = CommandLine.arguments[3]
                
                if first.isAnagramOf(second) {
                    consoleIO.write("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.write("\(second) is not an anagram of \(first)")
                }
            }
        case .palindrome:
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.write("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.write("Too few arguments for option \(option.rawValue)", to: .error)
                }
                consoleIO.printUsages()
            } else {
                let s = CommandLine.arguments[2]
                let isPalindrome = s.isPalindrome()
                consoleIO.write("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            }
        case .help:
            consoleIO.printUsages()
        case .unknown, .quit:
            consoleIO.write("Unknown option \(value)")
            consoleIO.printUsages()
        }
    }
    
    
    func interactiveMode() {
        consoleIO.write("Welcome to Panagram. This program checks if an input string is an anagram or palindrome.")
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.write("Type 'a' to check for anagrams or 'p' for palindromes type 'q' to quit.")
            let (option, value) = getOption(consoleIO.getInput())
            
            switch option {
            case .anagram:
                consoleIO.write("Type the first string:")
                let first = consoleIO.getInput()
                consoleIO.write("Type the second string:")
                let second = consoleIO.getInput()
                
                if first.isAnagramOf(second) {
                    consoleIO.write("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.write("\(second) is not an anagram of \(first)")
                }
            case .palindrome:
                consoleIO.write("Type a word or sentence:")
                let s = consoleIO.getInput()
                let isPalindrome = s.isPalindrome()
                consoleIO.write("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            case .quit:
                shouldQuit = true
            default:
                consoleIO.write("Unknown option \(value)", to: .error)
            }
        }
    }
    
    func getOption(_ option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
}
