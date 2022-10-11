//
//  iOS_Practical_TestApp.swift
//  iOS-Practical-Test
//
//  Created by Saif Adel on 12/10/22.
//

import SwiftUI

@main
struct iOS_Practical_TestApp: App {
    init() {
      UITableView.appearance().backgroundColor = UIColor.white
    }
    
    var body: some Scene {
        WindowGroup {
            MovieListView()
        }
    }
}
