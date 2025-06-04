import Foundation

class NewsService {
    private var observers = [WeakObserver]()
    private var allNewsItems: [NewsItem] = []
    private var currentCategory: NewsCategory = .all
    static let shared = NewsService()
    
    private var detailObservers = [WeakDetailObserver]()
    
    init() {
        allNewsItems = [
                   NewsItem(
                    id: UUID(uuidString: "B1A0903C-490D-489C-920C-A8245D1F391C") ?? UUID(),
                       category: .technology,
                       title: "Tech Giants Unveil Ambitious Plans for Sustainable Computing",
                       content: """
                       Em um anúncio histórico, as principais empresas de tecnologia revelaram estratégias abrangentes para alcançar 
                       a computação sustentável até 2030. O plano inclui:
                       
                       • Redução de 50% no consumo energético de data centers
                       • Uso exclusivo de energias renováveis
                       • Novos chips 30% mais eficientes
                       • Programa global de reciclagem de dispositivos
                       
                       "Esta é nossa contribuição para um futuro mais verde", afirmou a CEO durante o evento.
                       """,
                       author: "Amelia Harper",
                       publishDate: "Publicado há 2 dias",
                       stats: NewsStats(likes: 1200, comments: 345, shares: 234),
                       relatedArticles: [
                           RelatedArticle(category: .technology, title: "Novo Processador Eco-Friendly da Intel"),
                           RelatedArticle(category: .science, title: "Impacto Ambiental da Tecnologia em 2023")
                       ]
                   ),
                   
                   NewsItem(
                    id: UUID(uuidString: "B1A0903A-490A-489A-920A-A8245D1F391A") ?? UUID(),
                       category: .politics,
                       title: "Cúpula Global Discute Novas Políticas Climáticas",
                       content: """
                       Líderes mundiais se reuniram em Genebra para a Cúpula Anual do Clima. As principais decisões incluem:
                       
                       • Novo imposto sobre carbono para indústrias poluentes
                       • Fundo de US$ 100 bilhões para países em desenvolvimento
                       • Meta de redução de emissões em 45% até 2030
                       • Acordo sobre desmatamento zero
                       
                       O presidente declarou: "Esta é a última chance para ações decisivas."
                       """,
                       author: "Carlos Mendes",
                       publishDate: "Publicado há 1 dia",
                       stats: NewsStats(likes: 850, comments: 210, shares: 190),
                       relatedArticles: [
                           RelatedArticle(category: .politics, title: "Brasil se Compromete com Redução de 50%"),
                           RelatedArticle(category: .science, title: "Estudo Mostra Impacto do Acordo")
                       ]
                   ),
                   
                   NewsItem(
                    id: UUID(uuidString: "B1A0903B-490B-489B-920B-A8245D1F391B") ?? UUID(),
                       category: .sports,
                       title: "Brisbane é Escolhida para Sediar as Olimpíadas de 2032",
                       content: """
                       O Comitê Olímpico Internacional anunciou Brisbane como sede dos Jogos de 2032. Destaques:
                       
                       • 90% das instalações já existem
                       • Orçamento de US$ 5 bilhões
                       • Foco em sustentabilidade e acessibilidade
                       • Novos esportes incluídos: surf, escalada e breakdance
                       
                       "Estamos honrados e prontos para receber o mundo", disse o prefeito.
                       """,
                       author: "Fernanda Silva",
                       publishDate: "Publicado há 3 horas",
                       stats: NewsStats(likes: 3200, comments: 890, shares: 1500),
                       relatedArticles: [
                           RelatedArticle(category: .sports, title: "Atletas Brasileiros na Pré-Olímpica"),
                           RelatedArticle(category: .politics, title: "Investimento do Governo em Esportes")
                       ]
                   ),
                   
                   NewsItem(
                    id: UUID(uuidString: "B1A0903D-490E-489D-920D-A8245D1F391D") ?? UUID(),
                       category: .entertainment,
                       title: "Nova Trilogia de Ficção Científica Anunciada",
                       content: """
                       O aclamado diretor anunciou uma nova trilogia que expande o universo de sua franquia premiada. Detalhes:
                       
                       • Filmagens começam em 2024
                       • Orçamento total de US$ 600 milhões
                       • Tecnologia inédita de captura de movimento
                       • Elenco principal confirmado
                       
                       "Queremos levar a experiência do cinema a outro nível", revelou o produtor.
                       """,
                       author: "Ricardo Almeida",
                       publishDate: "Publicado há 5 horas",
                       stats: NewsStats(likes: 4500, comments: 1200, shares: 3200),
                       relatedArticles: [
                           RelatedArticle(category: .entertainment, title: "Entrevista Exclusiva com o Diretor"),
                           RelatedArticle(category: .technology, title: "Os Efeitos Visuais Revolucionários")
                       ]
                   ),
                   
                   NewsItem(
                    id: UUID(uuidString: "B1A0903E-490F-489F-920E-A8245D1F391E") ?? UUID(),
                       category: .science,
                       title: "Brasil Atinge Marco na Computação Quântica",
                       content: """
                       Pesquisadores brasileiros desenvolveram o primeiro computador quântico de 128 qubits da América Latina:
                       
                       • 100 milhões de vezes mais rápido que supercomputadores
                       • Aplicações em medicina, clima e criptografia
                       • Parceria entre USP, ITA e setor privado
                       • Investimento de R$ 200 milhões
                       
                       "Isso coloca o Brasil no mapa da tecnologia quântica", comemorou o ministro.
                       """,
                       author: "Dra. Juliana Santos",
                       publishDate: "Publicado ontem",
                       stats: NewsStats(likes: 2800, comments: 450, shares: 1200),
                       relatedArticles: [
                           RelatedArticle(category: .science, title: "Como Funciona a Computação Quântica"),
                           RelatedArticle(category: .technology, title: "Empresas que já Adotam a Tecnologia")
                       ]
                   ),
                   
                   NewsItem(
                    id: UUID(uuidString: "B1A09040-4910-4890-9210-A8245D1F391F") ?? UUID(),
                       category: .technology,
                       title: "Novo Smartphone com Câmera de Nível Profissional",
                       content: """
                       A nova geração de smartphones traz uma câmera desenvolvida com a NASA. Principais recursos:
                       
                       • Sensor de 200MP com estabilização avançada
                       • Modo astronomia para fotos noturnas
                       • IA que prevê melhores momentos para fotos
                       • Gravação 8K HDR
                       
                       "Redefinimos o que é possível com uma câmera de celular", disse o CTO.
                       """,
                       author: "Luiz Oliveira",
                       publishDate: "Publicado há 4 horas",
                       stats: NewsStats(likes: 3100, comments: 780, shares: 2400),
                       relatedArticles: [
                           RelatedArticle(category: .technology, title: "Tecnologia por Trás da Nova Câmera"),
                           RelatedArticle(category: .entertainment, title: "Fotógrafos Profissionais Testam o Aparelho")
                       ]
                   )
               ]
    }
    func addObserver(_ observer: NewsObserver) {
        observers.append(WeakObserver(observer: observer))
        notifyObservers()
    }
    
    func removeObserver(_ observer: NewsObserver) {
        observers.removeAll { $0.observer === observer }
    }
    
    func changeCategory(to category: NewsCategory) {
        currentCategory = category
        notifyObservers()
    }
    
    private func filteredNews() -> [NewsItem] {
        currentCategory == .all ? allNewsItems : allNewsItems.filter { $0.category == currentCategory }
    }
    
    private func notifyObservers() {
        let news = filteredNews()
        observers.forEach { $0.observer?.newsDidUpdate(newsItems: news, category: currentCategory) }
    }
    
    func getNewsDetail(for id: UUID) -> NewsItem? {
        print("🧪 Buscando detalhes para ID: \(id)")
        return allNewsItems.first(where: { $0.id == id })
    }
    func addDetailObserver(_ observer: NewsDetailObserver, for newsId: UUID) {
        detailObservers.append(WeakDetailObserver(observer: observer))
        if let item = getNewsDetail(for: newsId) {
            DispatchQueue.main.async {
                observer.newsDetailDidUpdate(newsItem: item)
            }
        }
    }
    
    func removeDetailObserver(_ observer: NewsDetailObserver) {
        detailObservers.removeAll { $0.observer === observer }
    }
}
