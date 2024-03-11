//
//  SwiftUIView.swift
//  Notes
//
//  Created by Артемий Дериглазов on 10.03.2024.
//

import SwiftUI

struct NoteView: View {
    @Environment(\.dismiss) private var dismiss
            
    @StateObject var viewModel: NoteViewModel

    var body: some View {
        NavigationStack {
            VStack {
                Text(toFormatDate(from: viewModel.timeStamp))
                    .foregroundStyle(.gray)
                TextEditor(text: $viewModel.enteredText)
            }
            .padding()
            .toolbar {
                ToolbarItem() {
                    Button(action: saveNote, label: {
                        if viewModel.isNewNote {
                            Image(systemName: viewModel.isEnteredTextEmpty() ? "xmark" : "checkmark")
                        }
                    })
                }
            }
        }
        .onDisappear() {
            if !viewModel.isNewNote {
                saveNote()
            }
        }
    }
    
    
    private func saveNote() {
        viewModel.saveNote()
        dismiss()
    }
}

