//
//  URLSessionProtocol.swift
//  Fetch Recipes
//
//  Created by Shontinique Uqdah on 7/7/24.
//

import Foundation

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        return try await self.data(from: url, delegate: nil)
    }
}
