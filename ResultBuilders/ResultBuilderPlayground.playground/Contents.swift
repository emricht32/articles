import UIKit

var htmlComponent = HTMLComponent.html {
    let isLoggedIn = false
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
print(htmlComponent)
