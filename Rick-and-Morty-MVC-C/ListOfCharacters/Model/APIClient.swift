//
//  APIClient.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import Foundation

final class ListOfCharactersAPIClient {
    func getListOfCharacters() async -> CharacterModelResponse {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { fatalError("URL string could not be parsed into a URL object") }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let model = try JSONDecoder().decode(CharacterModelResponse.self, from: data)
            
            return model
        } catch {
            fatalError("\(error.localizedDescription)")
        }
    }
}
