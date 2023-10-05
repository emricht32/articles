import Foundation

@resultBuilder
public struct FormBuilder {
    public static func buildBlock(_ components: HTMLComponent...) -> HTMLComponent {
        return HTMLComponent(tag: "form", children: components)
    }

    public static func buildExpression(_ expression: HTMLComponent) -> HTMLComponent {
        return expression
    }
}
