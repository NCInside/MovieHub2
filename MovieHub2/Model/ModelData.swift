//
//  ModelData.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//

import Foundation
import Combine

// The class to load and interact with the json data
final class ModelData: ObservableObject {
    @Published var movies: [Movie] = load("movieData.json")
    
    var categories: [String: [Movie]] {
        Dictionary(
            grouping: movies,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
