//
//  ModelRecognizer.swift
//  SurfTask
//
//  Created by Sergio on 10.02.23.
//

import Foundation

enum States {
    case xSmall
    case small
    case medium
    case large
}

extension States {
    var opposite: States {
        switch self {
        case .xSmall:
            return .small
        case .small:
            return .medium
        case .medium:
            return .large
        case .large:
            return .large
        }
    }

    var previous: States {
        switch self {
        case .xSmall:
            return .xSmall
        case .small:
            return .xSmall
        case .medium:
            return .small
        case .large:
            return .medium
        }
    }
}
