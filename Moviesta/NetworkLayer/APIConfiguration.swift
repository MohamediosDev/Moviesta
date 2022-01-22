//
//  APIConfiguration.swift
//  NetworkLayer
//
//  Created by SODA on 03/01/2022.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
}
