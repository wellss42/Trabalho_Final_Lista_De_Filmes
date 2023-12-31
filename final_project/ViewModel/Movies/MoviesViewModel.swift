//
//  MoviesViewModel.swift
//  final_project
//
//  Created by Jackson on 11/08/22.
//

import Foundation

class MoviesViewModel {
     
    private let service: MoviesServiceType
    var model: MoviesModelType
    
    var reloadTable: (() -> Void)?
    
    init(movies: MoviesModelType, service: MoviesServiceType) {
        self.model = movies
        self.service = service
    }
    
    func getMovies() {
        service.getMovies { [weak self] data, error in
            self?.model.setMovies(response: data)
            self?.reloadTable?()
        }
    }
     
}

