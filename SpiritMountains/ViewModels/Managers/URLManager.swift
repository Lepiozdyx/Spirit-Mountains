//
//  URLManager.swift
//  SpiritMountains
//
//  Created by Alex on 01.12.2024.
//

import Foundation

class URLManager: ObservableObject {
    private enum Keys {
        static let savedURL = "saved_url"
    }
    
    @Published private(set) var gameURL: URL?
    private let storage: UserDefaults
    
    static let initialURL = URL(string: "https://spiritgaming.xyz/icon")!
    
    init(storage: UserDefaults = .standard) {
        self.storage = storage
        loadSavedURL()
    }
    
    private func loadSavedURL() {
        if let urlString = storage.string(forKey: Keys.savedURL),
           let url = URL(string: urlString) {
            gameURL = url
        } else {
            print("Error loading a saved URL")
        }
    }
    
    func saveURL(_ url: URL) {
        storage.set(url.absoluteString, forKey: Keys.savedURL)
        gameURL = url
    }
    
    private func isTrashURL(_ url: URL) -> Bool {
        let trashURLs = ["about:blank", "about:srcdoc"]
        let isTrash = trashURLs.contains(url.absoluteString)
        return isTrash
    }
    
    func checkInitialURL() async throws -> URL? {
        
        do {
            let (_, response) = try await URLSession.shared.data(from: Self.initialURL)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return nil
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                return nil
            }
            
            if let finalURL = httpResponse.url {
                if finalURL.host?.contains("google.com") == true {
                    return nil
                }
                
                if isTrashURL(finalURL) {
                    return nil
                }
                
                if finalURL != Self.initialURL {
                    return finalURL
                } else {
                    print("Error")
                }
            } else {
                print("No URL found")
            }
            
            return nil
        } catch {
            throw error
        }
    }
}
