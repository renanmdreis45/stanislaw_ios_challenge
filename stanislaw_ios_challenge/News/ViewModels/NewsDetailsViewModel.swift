import SwiftUI

class NewsDetailViewModel: ObservableObject, NewsDetailObserver {
    @Published var newsItem: NewsItem?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let newsService: NewsService
    private let newsId: UUID
    
    var publicNewsId: UUID {
        newsId
    }


    init(newsService: NewsService = .shared, newsId: UUID) {
        self.newsService = newsService
        self.newsId = newsId
        print("🟢 ViewModel init with id: \(newsId)")
        loadNewsDetail()
    }

    func loadNewsDetail() {
        isLoading = true
        errorMessage = nil
        newsService.addDetailObserver(self, for: newsId)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if self.newsItem == nil {
                self.isLoading = false
                self.errorMessage = "Falha ao carregar os detalhes da notícia"
            }
        }
    }

    func newsDetailDidUpdate(newsItem: NewsItem) {
        DispatchQueue.main.async {
            self.newsItem = newsItem
            self.isLoading = false
        }
    }

    deinit {
        newsService.removeDetailObserver(self)
    }
}

