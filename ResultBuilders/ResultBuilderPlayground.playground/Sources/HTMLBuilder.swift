//
//  HTMLBuilder.swift
//  ResultBuilderProject
//
//  Created by Jon Emrich on 6/4/23.
//

import Foundation

@resultBuilder
public struct HTMLBuilder {
    public static func buildBlock(_ components: HTMLComponent...) -> HTMLComponent {
        return HTMLComponent(children: components)
    }
    
    public static func buildIf(_ component: HTMLComponent?) -> HTMLComponent {
        return component ?? HTMLComponent()
    }
    
    public static func buildEither(first: HTMLComponent) -> HTMLComponent {
        return first
    }
    
    public static func buildEither(second: HTMLComponent) -> HTMLComponent {
        return second
    }
}

