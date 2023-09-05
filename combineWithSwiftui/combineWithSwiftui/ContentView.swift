import Combine
import SwiftUI


struct Post : Decodable, Identifiable {
    let userId, id: Int
    let title, body: String
}

class PostViewModel: ObservableObject {
    @Published var post = [Post]()
    //var cancellable: AnyCancellable?
    
    var cancellable = URLSession.shared.dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
        .map(\.data)
        .decode(type: [Post].self, decoder: JSONDecoder())
        .sink(receiveCompletion: { result in
            print(result)
        }, receiveValue: { posts in
            print(posts)
            self.post = posts
        })
    
}

struct ContentView: View {
    @ObservedObject var postViewModel = PostViewModel()
    var body: some View {
        NavigationView {
            List(postViewModel.posts) { post in
                Text(post.title)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
