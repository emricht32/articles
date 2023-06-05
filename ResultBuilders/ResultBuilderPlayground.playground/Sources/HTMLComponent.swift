//
//  HTMLComponent.swift
//  ResultBuilderProject
//
//  Created by Jon Emrich on 6/4/23.
//

import Foundation
import UIKit


public struct HTMLComponent {
    let tag: String
    let attributes: [String: String]
    let children: [HTMLComponent]
    let text: String?

    init(tag: String = "", attributes: [String: String] = [:], children: [HTMLComponent] = [], text: String? = nil) {
        self.tag = tag
        self.attributes = attributes
        self.children = children
        self.text = text
    }
}

extension HTMLComponent: CustomStringConvertible {
    public var description: String {
        
        var result = "<\(tag)"

        // Add attributes if present
        if !attributes.isEmpty {
            let attributeString = attributes.map { "\($0)=\"\($1)\"" }.joined(separator: " ")
            result += " \(attributeString)"
        }

        // Add text content if present
        if let text = text {
            result += ">\(text)</\(tag)>"
        } else {
            result += ">"

            // Add child components recursively
            let childDescriptions = children.map { $0.description }
            result += childDescriptions.joined()

            result += "</\(tag)>"
        }
        
        result = result.replacingOccurrences(of: "<>", with: "")

        return result
    }
}

extension HTMLComponent {
    public static func html(@HTMLBuilder content: () -> HTMLComponent) -> HTMLComponent {
        let htmlComponent = content()
        return HTMLComponent(tag: "html", children: [htmlComponent])
    }
    
    public static func head(@HTMLBuilder content: () -> HTMLComponent) -> HTMLComponent {
        let headComponent = content()
        return HTMLComponent(tag: "head", children: [headComponent])
    }
    
    public static func title(_ text: String) -> HTMLComponent {
        return HTMLComponent(tag: "title", text: text)
    }
    
    public static func body(@HTMLBuilder content: () -> HTMLComponent) -> HTMLComponent {
        let bodyComponent = content()
        return HTMLComponent(tag: "body", children: [bodyComponent])
    }
    
    public static func h1(_ text: String) -> HTMLComponent {
        return HTMLComponent(tag: "h1", text: text)
    }
    
    public static func p(_ text: String) -> HTMLComponent {
        return HTMLComponent(tag: "p", text: text)
    }
    
    public static func li(_ text: String) -> HTMLComponent {
        return HTMLComponent(tag: "li", text: text)
    }
    
    public static func ul(@HTMLBuilder content: () -> HTMLComponent) -> HTMLComponent {
        let ulComponent = content()
        return HTMLComponent(tag: "ul", children: [ulComponent])
    }

}
