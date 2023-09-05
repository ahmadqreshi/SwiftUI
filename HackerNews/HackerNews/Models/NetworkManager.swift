//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Ahmad Qureshi on 09/05/22.
//

import Foundation
import Alamofire

class NetworkManager : ObservableObject {
    @Published var posts = [Post]()
    func fetchData() {
//        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let result = try decoder.decode(PostData.self, from: safeData)
//                            DispatchQueue.main.async {
//                                self.posts = result.hits
//                            }
//                        } catch {
//                            debugPrint(error.localizedDescription)
//                        }
//                    }
//                }
//            }
//            task.resume()
        AF.request("https://hn.algolia.com/api/v1/search?tags=front_page").response { response in
            switch response.result {
            case .success(let data) :
                do {
                    let result = try JSONDecoder().decode(PostData.self, from: data!)
                    DispatchQueue.main.async {
                        self.posts = result.hits
                    }
                } catch {
                    debugPrint(error.localizedDescription)
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
            debugPrint(response.result)
        }
    }
}
