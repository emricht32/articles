import Foundation

@resultBuilder
public struct BlogPostBuilder {
    public static func buildBlock(_ components: HTMLComponent...) -> HTMLComponent {
        return HTMLComponent(tag: "div", children: components)
    }

    public static func buildExpression(_ expression: HTMLComponent) -> HTMLComponent {
        return expression
    }

    public static func buildEither(first component: HTMLComponent) -> HTMLComponent {
        return component
    }

    public static func buildEither(second component: HTMLComponent) -> HTMLComponent {
        return component
    }
}

