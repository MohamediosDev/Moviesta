//
//  A.swift
//  NetworkLayer
//
//  Created by SODA on 03/01/2022.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case getCatogery// indicate Error Response
    
    
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getCatogery:
            return .get
        }
    }
    
    // MARK: - Parameters
    var parameters: RequestParams {
        switch self {
        case .getCatogery:
            return .url(["api_key":"e3f46d18b17ab357b7915fed01b70fac"])
        }
    }
    
    // MARK: - Path
    var path: String {
        
        switch self {
        case.getCatogery:
            return "/genre/tv/list"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try MainUrl.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        
        // Common Headers // if there is headers un comment this
        //        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        //       urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        switch parameters {
            
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
            
        case .url(let params):
            let queryParams = params.map { pair  in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
            
        case .NoParamter:
            urlRequest.httpBody = nil
        }
        
        return urlRequest
    }
}
