//
//  HomeView.swift
//  iOS-Practical-Test
//
//  Created by Saif Adel on 12/10/22.
//


import SwiftUI

struct MovieListView: View {
    @State var searchQuery = ""
    @ObservedObject var viewModel = MovieListViewModel()
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.loading {

                    ProgressView()
                } else {
                    List(viewModel.movies.results) { movie in
                        MovieListCell(movie: movie)

                    }
                    .listStyle(.inset)
                    .scrollIndicators(.hidden)
                    .padding()
                }
            }
            .navigationBarTitle(Text(StringConstant.appTitle.rawValue))
        }
        .searchable(text: $searchQuery,
                    prompt: StringConstant.searchPlaceHolder.rawValue){
           if viewModel.param != searchQuery {
                let _ = viewModel.param = searchQuery
                let _ = viewModel.fetchMovieList(searchQuery: searchQuery)
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
