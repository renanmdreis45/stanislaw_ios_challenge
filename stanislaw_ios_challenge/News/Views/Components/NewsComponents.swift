import SwiftUI

struct StatView: View {
    let count: Int
    let label: String
    let icon: String
    
    var body: some View {
        VStack {
            HStack(spacing: 4) {
                Image(systemName: icon)
                Text("\(count)")
                    .font(.subheadline)
            }
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct RelatedArticleCard: View {
    let article: RelatedArticle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(article.category.rawValue)
                .font(.caption)
                .foregroundColor(.blue)
                .bold()
            
            Text(article.title)
                .font(.subheadline)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
