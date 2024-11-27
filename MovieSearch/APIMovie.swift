//
//  APIMovie.swift
//  MovieSearch
//
//  Created by Jie Bao on 2024-11-26.
//

import Foundation
import Moya

enum APIMovie {
    case movieDetails(id: Int, page: Int)
}

extension APIMovie: TargetType {
    var baseURL: URL { .init(string: NetworkConfiguration.movieBaseURL)! }
    
    var path: String {
        switch self {
        case let .movieDetails(id, page):
            "list/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .movieDetails:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .movieDetails(id, page):
            return .requestParameters(parameters: ["page" : page], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
}
