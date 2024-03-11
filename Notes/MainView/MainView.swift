//
//  ContentView.swift
//  Notes
//
//  Created by Артемий Дериглазов on 09.03.2024.
//

import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.timeStamp, ascending: false)],
        animation: .default)
    private var notes: FetchedResults<Note>

    @State private var isPresented = false
    @State private var isShowAlert = false
    
    private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        NoteView(
                            viewModel: NoteViewModel(
                                enteredText: note.text ?? "",
                                isNewNote: false,
                                timeStamp: Date(),
                                editingNote: note
                                )
                            )
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(note.text ?? "no text")
                            Text(toFormatDate(from: note.timeStamp ?? Date()))
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                        }
                    }
                    .frame(height: 40)
                }
                .onDelete(perform: deleteNote)
            }
            .toolbar {
                ToolbarItem() {
                    Button(action: presentNoteView, label: {
                        Image(systemName: "plus")
                    })
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $isPresented, content: {
                NoteView(
                    viewModel: NoteViewModel(
                        enteredText: "",
                        isNewNote: true,
                        timeStamp: Date(),
                        editingNote: nil
                    )
                )
            })
            .navigationTitle("Notes")
        }
    }

    private func presentNoteView() {
        isPresented.toggle()
    }
    
    private func deleteNote(offsets: IndexSet) {
        withAnimation {
            offsets.map { notes[$0] }.forEach { note in
                viewModel.deleteNote(note)
            }
        }
    }
}


