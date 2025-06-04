import SwiftUI

struct NewsDetailView: View {
    @ObservedObject var viewModel: NewsDetailViewModel

    init(viewModel: NewsDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if let item = viewModel.newsItem {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text(item.category.rawValue.uppercased())
                            .font(.caption)
                            .foregroundColor(.blue)
                            .bold()

                        Text(item.title)
                            .font(.title)
                            .bold()

                        HStack {
                            Text(item.author)
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Spacer()

                            Text(item.publishDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }

                    // Stats
                    HStack(spacing: 24) {
                        StatView(count: item.stats.likes, label: "Likes", icon: "hand.thumbsup")
                        StatView(count: item.stats.comments, label: "Comments", icon: "bubble.left")
                        StatView(count: item.stats.shares, label: "Shares", icon: "arrowshape.turn.up.right")
                    }
                    .padding(.vertical)

                    Text(item.content)
                        .font(.body)
                        .lineSpacing(6)

                    if !item.relatedArticles.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Related Articles")
                                .font(.headline)

                            ForEach(item.relatedArticles) { article in
                                RelatedArticleCard(article: article)
                            }
                        }
                        .padding(.top, 24)
                    }
                } else {
                    Text("Nenhum dado para mostrar.")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

