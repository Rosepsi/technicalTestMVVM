//
//  NetworkManager.swift
//  TechnicalTestMVVM
//
//  Created by Rosa Herrero on 10/1/23.
//

import Alamofire


struct MarvelApi {

    static private let baseUrl = "https://gateway.marvel.com:443/v1/public/characters"
    static private let publicKey = "87e1d7fdae63dfe4897f0ac8cf783bac"
    static private let privateKey = "8ba3714f1a0a20e0495706ef1d913319e77d5da2"

    // MARK: Methods to obtain the urls
    
    static func getCharactersListUrl() -> String {
        let timeStamp = getTimeStamp()
        return baseUrl + "?ts=" + timeStamp + "&apikey=" + publicKey + "&hash=" + getHashCecksum(ts: timeStamp)
    }
    
    static func getDetailsUrl(_ id: Int) -> String {
        let timeStamp = getTimeStamp()
        return baseUrl + "/" + String(id) + "?ts=" + timeStamp + "&apikey=" + publicKey + "&hash=" + getHashCecksum(ts: timeStamp)
    }

    
    // MARK: Hash methods
    static private func getHashCecksum(ts: String) -> String {
        return String(format: "%@%@%@", ts, privateKey, publicKey).md5()
    }
    
    static private func getTimeStamp() -> String {
        // returns allways a different time stamp
        return String(format:"%.f", Date().timeIntervalSince1970)
    }
    
    private init() {}
}

class NetworkManager {
    static let shared = NetworkManager ()
    private init () {
    }
    
    func getCharacterList (completion: @escaping (Characters)-> ()) {
        AF.request(MarvelApi.getCharactersListUrl(), method: .get).validate(statusCode: 200...299).responseDecodable(of:CharacterDataWrapper.self){response in
            if let result = response.value {
                completion (result.data?.results ?? [])
            } else {
                completion ([])
            }
        }
    }
    
    func getCharacterDetail (id: Int, completion: @escaping (Characters)-> ()) {
        AF.request(MarvelApi.getDetailsUrl(id), method: .get).validate(statusCode: 200...299).responseDecodable(of:CharacterDataWrapperDetail.self){response in
            if let result = response.value {
                completion (result.data?.results ?? [])
            } else {
                completion ([])
            }
        }
    }
}
