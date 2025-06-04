# Stanislaw ios challenge
Repositório referente a um app simples de noticias para o desafio mobile iOS da Stanislaw Tech


# Decisões arquiteturais
  
  Optei por uma organização em camadas na arquitetura MVVM. Separei a entidade principal de News e entidades relacionadas na camada Model. A comunicação entre a view de listagem de noticias e detalhes de cada uma com a model era feita por meio da View Model, sendo uma para cada tela, responsável pela lógica de estados e alterações na renderização da UI. Nesse sentido, utilizei um Observer Pattern. Nas views, as telas são renderizadas e exibidas de acordo com os requisitos do Desafio, sendo uma tela para exibir a listagem de cada notícia onde é possível filtrar por pesquisa de texto e dropdown de categorias. Os services utilizados dentro da camada de model utilizam o Observer Pattern para notificar os Observers de qualquer alteração de estado da model.
  
 # 🔧 Como rodar a aplicação (iOS - Swift)
  
  - Para executar este projeto iOS feito em Swift, siga os passos abaixo:

  - Pré-requisitos:
    - macOS instalado

    - Xcode 15 ou superior

    - Um simulador iOS (ou um dispositivo físico)

    - Passos para rodar:
      - Clone o repositório:
     
```
git clone https://github.com/renanmdreis45/stanislaw_ios_challenge
cd para_a_pasta_do_repositorio
```

  - Compile e rode o app:
      - No Xcode:
        - Selecione um simulador (ex: iPhone 15)
        - Clique no botão ▶️ (Run) no canto superior esquerdo
  - Abra o projeto no Xcode
    - Clique duas vezes no arquivo .xcodeproj ou .xcworkspace (caso esteja usando CocoaPods). 

# Rodando a aplicação

  [Demonstração](https://youtube.com/shorts/fbw_ISFjoEU?feature=share)

# Melhorias futuras
  
  Pretendo adicionar alguns testes unitários e de interface para a aplicação, além do armazenamento dos dados em cache.
  


