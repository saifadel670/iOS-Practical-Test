//
//  ApiManager.swift
//  iOS-Practical-Test
//
//  Created by Saif Adel on 12/10/22.
//
import Foundation

enum BaseURL : String {
    case movileList = "https://api.themoviedb.org"
    case moviePoster = "https://image.tmdb.org/t/p/w500/"
}

struct Api {
    static func getUrl(baseURL: BaseURL, path: String) -> URL?{
        return URL(string: baseURL.rawValue + path)
    }
}

extension URL {
    
    static let moviePath: (String) -> URL? = { param in
        let paramsValue = param.isEmpty ? StringConstant.marvel.rawValue  : param
        
        return Api.getUrl(baseURL: .movileList, path: "/3/search/movie?api_key=\(KEY)&query=\(paramsValue)")
    }
    
    static let posterUrl: (String) -> URL? = { path in
        return Api.getUrl(baseURL: .moviePoster, path: path)
    }
}

