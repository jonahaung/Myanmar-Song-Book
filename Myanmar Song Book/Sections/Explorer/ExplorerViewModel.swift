//
//  ExplorerViewModel.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 9/5/22.
//

import Foundation
import FirebaseFirestore

final class ExplorerViewModel: ObservableObject {
    
    let filter: QueryFilter?
    @Published var songs = [Song]()
    
    init(_ filter: QueryFilter?) {
        self.filter = filter
    }
    
    func fetch() async {
        let songs: [Song] = await APIService.shared.GET(query: APIService.Constants.itemRef.filter(with: filter))
        DispatchQueue.main.async {
            self.songs = songs
        }
    }
}


extension Query {
    
    func filter(with item: QueryFilter?) -> Query {
        guard let item = item else { return self }
        return self.whereField(item.property.key, isEqualTo: item.text)
    }
}
