import UIKit

func getFeaturedImageURL() -> String?{
    "image.png"
}

@HTMLBuilder
func buildHTML(isLoggedIn: Bool) -> HTMLComponent {
    HTMLComponent.head {
        HTMLComponent.title("My Page")
    }
    HTMLComponent.body {
        HTMLComponent.h1("Welcome!")
        HTMLComponent.p("This is my website.")
        if isLoggedIn {
            HTMLComponent.p("You are logged in.")
        } else {
            HTMLComponent.p("Please log in to access more content.")
        }
        HTMLComponent.ul {
            HTMLComponent.li("Item 1")
            HTMLComponent.li("Item 2")
            HTMLComponent.li("Item 3")
        }
    }
}
let htmlComponent = buildHTML(isLoggedIn:true)
print(htmlComponent)

@FormBuilder
func buildForm() -> HTMLComponent {
    HTMLComponent.div {
        HTMLComponent.h1("Contact Form")
        HTMLComponent.section {
            HTMLComponent.label(for: "text", text: "Name:")
            HTMLComponent.input(type: "text", name: "")
        }
        HTMLComponent.section {
            HTMLComponent.label(for: "text", text: "Email:")
            HTMLComponent.input(type: "email", name: "")
        }
        HTMLComponent.section {
            HTMLComponent.label(for: "text", text: "Message:")
            HTMLComponent.textarea(name:"")
        }
        HTMLComponent.button(text: "Submit")
    }
}
let formComponent = buildForm()
print(formComponent)

@BlogPostBuilder
func buildBlogPost() -> HTMLComponent {
    HTMLComponent.div {
        HTMLComponent.h1("Blog Post Title")
        HTMLComponent.p("Published on June 1, 2023")

        if let imageUrl = getFeaturedImageURL() {
            HTMLComponent.img(src: imageUrl, alt: "Featured Image")
        } else {
            HTMLComponent.p("No featured image available.")
        }

        HTMLComponent.div {
            HTMLComponent.p("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
            HTMLComponent.p("Pellentesque ac ex id velit hendrerit eleifend. Nunc id arcu nibh.")
            HTMLComponent.p("Suspendisse in interdum lorem, sit amet sagittis purus.")
        }
    }
}
let blogPostComponent = buildBlogPost()
print(blogPostComponent)

@ListBuilder
func buildList(items:[String]) -> [HTMLComponent] {
     return items.map { HTMLComponent.li($0) }
}
let items = ["Item 1", "Item 2", "Item 3", "Item 4"]
let listItems = buildList(items:items)
print(listItems)
