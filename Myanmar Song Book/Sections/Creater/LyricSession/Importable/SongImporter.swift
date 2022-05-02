//
//  ImportableModifier.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 2/5/22.
//

import SwiftUI
struct SongImporter: ViewModifier {
    
    @EnvironmentObject private var viewModel: CreaterViewModel
    
    @State private var importType: ImportType?
    @State private var currentImportType: ImportType?
    @State private var pickedItem: PickedItem?
    @State private var pickedImage: UIImage?
    @State private var importedItem: ImportedItem?
    
    func body(content: Content) -> some View {
        content
            .navigationBarItems(trailing: menu)
            .fullScreenCover(item: $importType, onDismiss: {
                DispatchQueue.main.async {
                    importType = nil
                    if let pickedItem = pickedItem {
                        switch pickedItem {
                        case .Text(let string):
                            self.viewModel.textView?.insert(text: string)
                        case .Image(let uIImage):
                            pickedImage = uIImage
                        case .None:
                            print("None")
                        }
                    }
                }
            }, content: {
                switch $0 {
                case .Camera:
                    ImagePicker(isCamera: true, item: $pickedItem)
                        .edgesIgnoringSafeArea(.all)
                case .Document_Scanner:
                    DocumentScanner(item: $pickedItem)
                        .edgesIgnoringSafeArea(.all)
                case .Photo_Library:
                    ImagePicker(isCamera: false, item: $pickedItem)
                        .edgesIgnoringSafeArea(.all)
                case .ChordPro_File:
                    DocumentPicker(item: $pickedItem)
                        .edgesIgnoringSafeArea(.all)
                }
            })
            .fullScreenCover(item: $pickedImage, onDismiss: {
                DispatchQueue.main.async {
                    pickedImage = nil
                    if let result = importedItem {
                        switch result {
                        case .OCR(let string):
                            self.viewModel.textView?.insert(text: string)
                        case .Cancel:
                            importType = nil
                            currentImportType = nil
                        case .Redo:
                            importType = currentImportType
                        }
                    }
                }
            }, content: {
                OcrImageView(viewModel: .init(image: $0), importedItem: $importedItem)
            })
    }
    
    private var menu: some View {
        Menu {
            ForEach(ImportType.allCases) { mode in
                Button(mode.description) {
                    currentImportType = mode
                    importType = mode
                }
            }
        } label: {
            Text("Import")
        }
    }
}

extension SongImporter {
    
    enum ImportType: String, CustomStringConvertible, CaseIterable, Identifiable {
        case Document_Scanner, Camera, Photo_Library, ChordPro_File
        var id: String { rawValue }
        var description: String {
            switch self {
            case .Document_Scanner:
                return "Document Scanner"
            case .Camera:
                return "Camera"
            case .Photo_Library:
                return "Photo Library"
            case .ChordPro_File:
                return "ChordPro File"
            }
        }
    }
    enum ImportedItem {
        case OCR(text: String)
        case Redo
        case Cancel
    }
}

extension View {
    func importable() -> some View {
        ModifiedContent(content: self, modifier: SongImporter())
    }
}
