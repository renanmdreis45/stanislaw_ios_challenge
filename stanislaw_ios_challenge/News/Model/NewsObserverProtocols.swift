import Foundation

protocol NewsObserver: AnyObject {
    func newsDidUpdate(newsItems: [NewsItem], category: NewsCategory)
}

protocol NewsDetailObserver: AnyObject {
    func newsDetailDidUpdate(newsItem: NewsItem)
}

struct WeakObserver {
    weak var observer: NewsObserver?
}

struct WeakDetailObserver {
    weak var observer: NewsDetailObserver?
}
