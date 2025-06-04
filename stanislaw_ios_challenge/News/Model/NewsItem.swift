import Foundation

struct NewsItem: Identifiable {
    let id: UUID
    let category: NewsCategory
    let title: String
    let content: String
    let author: String
    let publishDate: String
    let stats: NewsStats
    let relatedArticles: [RelatedArticle]
}

struct NewsStats {
    let likes: Int
    let comments: Int
    let shares: Int
}

struct RelatedArticle: Identifiable {
    let id = UUID()
    let category: NewsCategory
    let title: String
}

enum NewsCategory: String, CaseIterable {
    case all = "All"
    case politics = "Politics"
    case technology = "Technology"
    case sports = "Sports"
    case entertainment = "Entertainment"
    case science = "Science"
}
