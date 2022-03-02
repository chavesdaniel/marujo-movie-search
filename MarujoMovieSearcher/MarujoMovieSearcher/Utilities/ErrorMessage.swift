//
//  ErrorMessage.swift
//  MarujoMovieSearcher
//
//  Created by Daniel on 01/03/22.
//

import Foundation

enum MSError: String, Error {
    case invalidUserName    = "Requisição inválida. Por favor tente novamente."
    case unableToComplete   = "Não foi possível completar a requisição. Por favor verifique sua conexão."
    case invalidResponse    = "Resposta inválida do servidor. Por favor tente novamente."
    case invalidData        = "Resposta com dados inválidos. Por favor tente novamente."
    case unableToConvert    = "Problema ao ler dados recebidos do servidor."
}
