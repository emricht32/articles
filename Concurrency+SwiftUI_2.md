
## Part 2:  Concurrency and SwiftUI

Welcome to Part 2 of our tutorial on Concurrency and SwiftUI! In this part, we will discuss strategies for organizing networking code with Concurrency, and how to use advanced features of Concurrency like handling multiple network requests concurrently and canceling requests.

### Organizing Networking Code

As our app grows in complexity, it becomes more and more important to keep our networking code organized and maintainable. Here are some strategies we can use to keep our networking code organized:

### 1. Separating Concerns

Separating concerns means dividing our networking code into small, modular pieces that each handle a specific responsibility. For example, we might have a NetworkManager class that handles all our network requests, a ResponseParser class that handles parsing JSON responses, and a CacheManager class that handles caching responses.
By separating concerns, we can make our networking code more maintainable and easier to understand. Each class is responsible for one thing, and it's easier to reason about the behavior of each class when its responsibilities are clearly defined.

### 2. Encapsulating Concurrency

Concurrency can make our networking code more complex, but we can encapsulate that complexity to make it easier to manage. For example, we might create a NetworkTask class that encapsulates a network request and its associated state, like whether the request is in progress or has completed.
By encapsulating concurrency in this way, we can simplify our networking code and make it easier to reason about. We can also create higher-level abstractions on top of NetworkTask, like a NetworkOperationQueue that manages a queue of network requests.

### 3. Advanced Concurrency Features

Now that we've covered some strategies for organizing networking code with Concurrency, let's look at some advanced features of Concurrency that can help us write more efficient networking code.

### Concurrent Requests

Concurrency allows us to execute multiple tasks concurrently, which can significantly improve the performance of our app. For example, we might want to fetch data from multiple endpoints in parallel, rather than fetching each endpoint one at a time.
Here's an example of how to fetch data from multiple endpoints concurrently using Concurrency:

```swift
async let postRequest = NetworkManager.shared.fetchData(from: "https://jsonplaceholder.typicode.com/posts/1") 
async let commentRequest = NetworkManager.shared.fetchData(from: "https://jsonplaceholder.typicode.com/comments?postId=1") 
let postData = try await postRequest 
let commentData = try await commentRequest 
let post = try JSONDecoder().decode(Post.self, from: postData) 
let comments = try JSONDecoder().decode([Comment].self, from: commentData) // Do something with post and comments...
```

In this example, we use the async let syntax to start two requests concurrently, one to fetch a post and one to fetch comments for that post. Once both requests have completed, we decode the response data and use the resulting objects in our app.

### Request Cancellation

Sometimes we might want to cancel a network request if it's no longer needed, or if the user has navigated away from the screen that initiated the request. Concurrency allows us to cancel tasks using the `Task.cancel()` method.
Here's an example of how to cancel a network request using Concurrency:

```swift
struct ContentView: View { 
  @StateObject private var viewModel = ContentViewModel() 
  @State private var isRequestCancelled = false 
  var body: some View { 
    VStack { 
      if let title = viewModel.post?.title { 
        Text(title) 
      } else if isRequestCancelled { 
        Text("Request Cancelled") 
      } else { 
        ProgressView() 
      }
    }
    .task { 
      do { 
        try await viewModel.fetchData() 
      } catch { 
        if Task.isCancelled {
          isRequestCancelled = true 
        }
      }
    }
    .onDisappear { 
      Task { 
        await viewModel.cancelRequest() 
      }
    }
  }
}

class ContentViewModel: ObservableObject {
@Published var post: Post?
private var fetchTask: Task<Void, Error>?
func fetchData() async throws { 
  let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")! 
  let (data, _) = try await URLSession.shared.data(from: url) 
  post = try JSONDecoder().decode(Post.self, from: data) 
} 
  func cancelRequest() { 
    fetchTask?.cancel() 
  }
}
```

In this example, we have a `ContentView` that displays the title of a post fetched from an API. We use the `.task` modifier to fetch the post data asynchronously, and we also use the `.onDisappear` modifier to cancel the request if the user navigates away from the screen. The `ContentViewModel` class encapsulates the network request and allows us to cancel it using the `cancelRequest()` method. When the request is cancelled, the `.task` modifier will throw a `CancellationError`, which we catch and use to update the UI. 

### Conclusion and Next Steps 

In this part of our tutorial, we learned strategies for organizing networking code with Concurrency, and how to use advanced features of Concurrency like handling multiple network requests concurrently and canceling requests. In the final part of our tutorial, we will build a sample app that uses Concurrency and SwiftUI to fetch data from an API and display it in a user-friendly way. We will also discuss best practices for using Concurrency in combination with SwiftUI, and provide additional resources for learning more. Stay tuned for Part 3!
