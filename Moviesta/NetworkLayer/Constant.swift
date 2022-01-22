//
//  Constant.swift
//  NetworkLayer
//
//  Created by SODA on 03/01/2022.
//

import Foundation
import Alamofire

struct MainUrl {
    
    static let baseURL = "https://api.themoviedb.org/3"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
    
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
    case NoParamter
}

