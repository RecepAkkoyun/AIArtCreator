//
//  Unwrappers.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 16.11.2022.
//

import Foundation
import UIKit

func unwrapToString(variable: Any) -> String {
    if let unwrapped = variable as? String {
        return unwrapped
    } else {
        return ""
    }
}

func unwrapToBool(variable: Any) -> Bool {
    if let unwrapped = variable as? Bool {
        return unwrapped
    } else {
        return false
    }
}

func unwrapToDate(variable: Any) -> Date {
    if let unwrapped = variable as? Date {
        return unwrapped
    } else {
        return Date()
    }
}

func unwrapToData(variable: Any) -> Data {
    if let unwrapped = variable as? Data {
        return unwrapped
    } else {
        return Data()
    }
}

func unwrapToURL(variable: Any) -> URL {
    if let unwrapped = variable as? URL {
        return unwrapped
    } else {
        return URL(string: "https://www.google.com/")!
    }
}

func unwrapToImage(variable: Any) -> UIImage {
    if let unwrapped = variable as? UIImage {
        return unwrapped
    } else {
        return UIImage(named: "imgSearch")!
    }
}

func unwrapToCGFloat(variable: Any) -> Double {
    if let unwrapped = variable as? Double {
        return unwrapped
    } else {
        return 0.0
    }
}

func unwrapToInt(variable: Any) -> Int {
    if let unwrapped = variable as? Int {
        return unwrapped
    } else {
        return 0
    }
}

func unwrapToDict(variable: Any) -> [String: Any] {
    if let unwrapped = variable as? [String: Any] {
        return unwrapped
    } else {
        return ["": ""]
    }
}

func unwrapToDictArr(variable: Any) -> [[String: Any]] {
    if let unwrapped = variable as? [[String: Any]] {
        return unwrapped
    } else {
        return [["": ""]]
    }
}

func unwrapToStrArr(variable: Any) -> [String] {
    if let unwrapped = variable as? [String] {
        return unwrapped
    } else {
        return [""]
    }
}
