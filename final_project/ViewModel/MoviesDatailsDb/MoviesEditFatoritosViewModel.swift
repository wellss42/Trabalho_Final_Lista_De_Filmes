//
//  MoviesDetailsDbViewModel.swift
//  final_project
//
//  Created by wellington martins on 08/07/23.
//

import Foundation

protocol MoviesEditViewModelDelegate: AnyObject  {
     func editSuccess(success: FavoritarResponse)
     func editError(error: String)
}

class MoviesEditFatoritosViewModel {
     
     weak var delegate: MoviesEditViewModelDelegate?
     private let service: MoviesDetailsDbService
     
     var updateMovieDetails: (() -> Void)?

     init(service: MoviesDetailsDbService) {
          self.service = service
     }
     
     func editDetailsDb(id: String, title: String, pontuacaoMedia: String, totalVotos: String, imagem: String) {
          service.editDetailsDb(id: id, title: title, pontuacaoMedia: pontuacaoMedia, totalVotos: totalVotos, imagem: imagem){ result in
               DispatchQueue.main.async {
                    switch result {
                    case .success(let movieListDbResponse):
                         self.delegate?.editSuccess(success: movieListDbResponse)
                    case .failure(let error):
                         self.delegate?.editError(error: error.description)
                    }
                    
               }
          }
     }
     
}
