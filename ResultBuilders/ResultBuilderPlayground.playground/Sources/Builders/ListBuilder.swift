import Foundation

@resultBuilder
public struct ListBuilder {
    public static func buildBlock(_ components: [HTMLComponent]...) -> [HTMLComponent] {
        return components.flatMap { $0 }
    }

    public static func buildExpression(_ expression: HTMLComponent) -> [HTMLComponent] {
        return [expression]
    }

    public static func buildArray(_ components: [[HTMLComponent]]) -> [HTMLComponent] {
        return components.flatMap { $0 }
    }
}
