//
//  CreaterForm.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct CreaterForm: View {
    
    @EnvironmentObject private var viewModel: CreaterViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section("* Required Fields") {
                FormCell(icon: .doc_append, color: XColor.Light.blue) {
                    TextField("Song Title", text: $viewModel.song.title)
                }
                FormCell(icon: .music_mic, color: XColor.Light.blue) {
                    ArtistTextField(text: $viewModel.song.artist)
                }
            }
            
            Section("Instrument") {
                FormCell(icon: .tuningfork, color: XColor.Light.red) {
                    Picker("Key", selection: $viewModel.song.key) {
                        ForEach(Chord.Key.allCases) {
                            Text($0.rawValue)
                                .tag($0.rawValue)
                        }
                    }
                    
                }
                FormCell(icon: .metronome, color: XColor.Light.red) {
                    TextField.init("Tempo", text: $viewModel.song.tempo)
                        .keyboardType(.numbersAndPunctuation)
                }
            }
            
            Section("Additional Informations") {
                FormCell(icon: .highlighter, color: XColor.Light.purple) {
                    TextField.init("Composer", text: $viewModel.song.composer)
                    
                }
                FormCell(icon: .magazine, color: XColor.Light.purple) {
                    TextField.init("Album", text: $viewModel.song.album)
                }
                FormCell(icon: .calendar, color: XColor.Light.purple) {
                    TextField.init("Year", text: $viewModel.song.year)
                        .keyboardType(.numbersAndPunctuation)
                }
                FormCell(icon: .music_note_tv, color: XColor.Light.purple) {
                    Picker("Genre", selection: $viewModel.song.genre) {
                        ForEach(Genre.allCases) {
                            Text($0.rawValue)
                                .tag($0.rawValue)
                        }
                    }
                }
                FormCell(icon: .link, color: XColor.Light.purple) {
                    TextField.init("Media Link", text: $viewModel.song.mediaLink)
                        .keyboardType(.URL)
                }
            }
            Section("Import") {
                Button("Hotel California") {
                    viewModel.song.set(song: .hotelCalifornia)
                }
                Button("Myanmar") {
                    viewModel.song.set(song: .myanmar)
                }
                Text("Continue")
                    .tapToPush(CreaterLyricSession())
            }
        }
        .onSubmit {
            onSubmit()
        }
        .autocapitalization(.words)
        .navigationBarItems(leading: clearButton, trailing: doneButton)
        .embeddedInNavigationView(showCancelButton: false)
        
    }
    
    private var doneButton: some View {
        Button("Done") {
            dismiss()
        }.disabled(viewModel.song.hasNotFilledForm)
    }
    private var clearButton: some View {
        Text("Clear")
            .tapToShowComfirmationDialog(dialog: .init(message: "Are you sure to clear form?", items: [.init(title: "Clear Form", action: onClear)]))
            .disabled(!clearButtonEnable)
    }
    private var clearButtonEnable: Bool {
        !viewModel.song.title.isWhitespace || !viewModel.song.artist.isWhitespace || !viewModel.song.rawText.isWhitespace
    }
    private func onClear() {
        viewModel.song = .init()
    }
    private func onSubmit() {
        if !viewModel.song.hasNotFilledForm {
            dismiss()
        }
    }
}
