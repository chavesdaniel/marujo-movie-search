# marujo-movie-search
iOS Movie Search Project

Este pequeno projeto faz uso da API https://developers.themoviedb.org/3/movies/get-popular-movies trazendo uma breve descrição dos filmes mais populares.

Detalhes:
 - NO Storyboard
 - Xcode 13.2.1
 - Swift 5
 - Conexão usando URLSession.shared.dataTask
 - Listagem usando UICollectionViewDiffableDataSource com duas colunas (UICollectionViewFlowLayout) para uma visualização mais rápida dos filmes
 - Cache das imagens (NSCache)
 - Alertas, Botões, Imagens e Labels em Views Customizadas
 - Parse dos JSONs usando Codable
 - Suporte para Dark Mode
