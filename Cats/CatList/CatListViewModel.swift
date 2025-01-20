//
//  CatListViewModel.swift
//  Cats
//
//  Created by Bhuiyan Wasif on 10/25/23.
//

import Foundation
import Combine
import SwiftUI
import UIKit

class CatListViewModel: ObservableObject, CatService {
    
    internal var apiSession: APIService
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var showAlert = false
    
    // Load for storage
    @Published var storedCats = DatabaseManager.shared.fetchAllCatItems()
    
    var alertMessage = "Unknown error"
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getCatList() {
        let cancellable = self.getCatList()
            .sink(receiveCompletion: {[weak self] result in
                switch result {
                case .failure(let error):
                    self?.alertMessage = "\((error as NSError).localizedDescription)"
                    self?.showAlert = true
                case .finished:
                    break
                }
            }) { (cats) in
                // Store into storage
                DatabaseManager.shared.addCatListItems(cats)
                // Set from storage
                self.storedCats = DatabaseManager.shared.fetchAllCatItems()
        }
        cancellables.insert(cancellable)
    }
}
