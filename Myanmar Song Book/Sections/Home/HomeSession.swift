//
//  HomeSession.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct HomeSession: View {
    var body: some View {
        SearchableView {
            HomeSessionNavItemsView {
                XScrollView {
                    VStack(spacing: 0) {
                        XSectionView {
                            SingerTagsView()
                        }
                        XSectionView {
                            IconTagsView()
                        }
                        XSectionView {
                            GenreTagsView()
                        }
                    }
                }
            }
        }
    }
}
