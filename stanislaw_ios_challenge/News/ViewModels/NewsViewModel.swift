import SwiftUI

class NewsViewModel: ObservableObject, NewsObserver {
    @Published var newsItems: [NewsItem] = []
    @Published var selectedCategory: NewsCategory = .all {
        didSet {
            newsService.changeCategory(to: selectedCategory)
        }
    }
    
    private let newsService: NewsService
    
    init(newsService: NewsService = NewsService()) {
        self.newsService = newsService
        newsService.addObserver(self)
    }
    
    func newsDidUpdate(newsItems: [NewsItem], category: NewsCategory) {
        DispatchQueue.main.async {
            self.newsItems = newsItems
            self.selectedCategory = category
        }
    }
    
    deinit {
        newsService.removeObserver(self)
    }
}
