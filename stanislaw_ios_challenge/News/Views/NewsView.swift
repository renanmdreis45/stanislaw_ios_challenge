import SwiftUI

struct NewsView: View {
    @EnvironmentObject var viewModel: NewsViewModel
    @State private var searchText: String = ""

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(filteredNewsItems) { item in
                    NavigationLink(destination: NewsDetailView(viewModel: NewsDetailViewModel(newsId: item.id))) {
                        NewsCard(item: item)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .navigationTitle("News")
        .searchable(text: $searchText, prompt: "Search news")
        .toolbar {
            CategoryToolbar()
        }
    }

    private var filteredNewsItems: [NewsItem] {
        if searchText.isEmpty {
            return viewModel.newsItems
        } else {
            return viewModel.newsItems.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.author.localizedCaseInsensitiveContains(searchText) ||
                $0.content.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}


private struct NewsCard: View {
    let item: NewsItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.category.rawValue.uppercased())
                .font(.caption)
                .foregroundColor(.blue)
                .bold()
            
            Text(item.title)
                .font(.headline)
            
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
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

private struct CategoryToolbar: View {
    @EnvironmentObject var viewModel: NewsViewModel
    
    var body: some View {
        Menu {
            ForEach(NewsCategory.allCases, id: \.self) { category in
                Button(category.rawValue) {
                    viewModel.selectedCategory = category
                }
            }
        } label: {
            Label("Categories", systemImage: "line.3.horizontal.decrease.circle")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsView()
                .environmentObject(NewsViewModel())
        }
    }
}
