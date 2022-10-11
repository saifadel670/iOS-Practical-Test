//
//  MovieListViewModel.swift
//  iOS-Practical-Test
//
//  Created by Saif Adel on 12/10/22.
//

import Foundation


class MovieListViewModel: ObservableObject {
    @Published var movies = MovieListModel.Response.init( results: [])
    @Published var loading = false
    var param : String = ""
    
    init() {
        loading = true
        fetchMovieList()
    }
    
    public func fetchMovieList(searchQuery : String = StringConstant.marvel.rawValue) {
        guard var url = URL.moviePath(searchQuery) else {
            fatalError("URl was incorrect")
        }
        
       
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else { return }
            do{
                let movies : MovieListModel.Response = try JSONDecoder().decode(MovieListModel.Response.self, from: data)
                DispatchQueue.main.async {
                    self.movies = movies
                    self.loading = false
                }
            }
            catch(let e) {
                print("exceptin:- \(e.localizedDescription)")
            }
        }.resume()
    }
}
