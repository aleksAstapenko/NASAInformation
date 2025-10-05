//
//  ImageCashed.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 5.10.25.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    var objectWillChange: ObservableObjectPublisher?
    
    @Published var image: UIImage?
    private var url: URL?
    private var task: URLSessionDataTask?
    
    func load(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.url = url
        
        // Проверяем кэш
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else { return }
            
            // Сохраняем в кэш
            if let response = response {
                let cachedResponse = CachedURLResponse(response: response, data: data)
                URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}

struct CachedAsyncImage: View {
    @StateObject private var loader = ImageLoader()
    let urlString: String
    
    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            loader.load(from: urlString)
        }
        .onDisappear {
            loader.cancel()
        }
    }
}
