//
//  MovieListCell.swift
//  iOS-Practical-Test
//
//  Created by Saif Adel on 12/10/22.
//

import SwiftUI

import SwiftUI

struct MovieListCell : View {
    var movie: MovieListModel.Results
    
    let placeHolder : some View =
    Image(StringConstant.posterPlaceHolderPath.rawValue)
            .resizable()
            .frame(width: 90, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    
    
    var body: some View {
        HStack {
            if let _ = movie.poster_path {
                if let url = URL.posterUrl(movie.poster_path!) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        placeHolder
                    }
                    .frame(width: 90, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
            }
            else {
                placeHolder
            }
           
                           
            
            
            VStack (alignment: .leading){
                Text(movie.title!).font(.title3)
                    Spacer()
                    Text(movie.overview!)
                Spacer()
            }
        }.frame(height: 130)
    }
}

