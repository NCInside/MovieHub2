//
//  MovieCard.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//

import SwiftUI

struct MovieCard: View {
    
    var movie: Movie
    
    var body: some View {
        VStack {
            movie.image
                .resizable()
            HStack {
                ForEach (0..<(Int(movie.score)+1), id: \.self) {_ in
                    Image(systemName: "star.fill")
                }
                ForEach (0..<Int(5-movie.score), id: \.self) {_ in
                    Image(systemName: "star.fill")
                }
            }
            Text(movie.title)
            HStack {
                Text(movie.genres[0])
                Text("|")
                Text("\(movie.duration / 60)h \(movie.duration % 60)m")
                Text("|")
                Text(movie.rating)
            }
        }
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var movies = ModelData().movies
    
    static var previews: some View {
        MovieCard(movie: movies[0])
    }
}
