//
//  ContentView.swift
//  WordScramble
//
//  Created by Rahul Sharma on 28/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showError: Bool = false
    
    @State private var userScore = 0
    @State private var chances = 10
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .textInputAutocapitalization(.never)
                    }
                    
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                    Text("User's score is \(userScore).")
                        .frame(maxWidth: 250, maxHeight: 75)
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    Spacer()
                }
            }
//            .navigationTitle(rootWord)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button("Restart") {startGame()}
                }
                ToolbarItem(placement: .principal) {
                    Text(rootWord)
                        .font(.largeTitle.bold())
                }
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showError) {
                // This will automatically show an ok button
            } message: { Text(errorMessage) }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 3 else {
            wordError(title: "Short word", message: "Word is too short!")
            newWord = ""
            return
        }
        
        guard answer != rootWord else {
            wordError(title: "Can't do that", message: "You can't use the start word!")
            newWord = ""
            return
        }
        
        guard isOriginal(answer) else {
            wordError(title: "Word already used", message: "Be more original!")
            newWord = ""
            return
        }
        
        guard isPossible(answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            newWord = ""
            return
        }
        
        guard isReal(answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            newWord = ""
            return
        }
        
        // calculate user score
        userScore += 5
        if(answer.count < rootWord.count || answer.count > rootWord.count) {
            userScore -= 1
        }
        if chances != 0 {
            userScore -= 1
            chances -= 1
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame() {
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordURL, encoding: .utf8) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // resetting the list to empty
                usedWords = []
                // resetting the user score
                userScore = 0
                
                return
            }
        }
        
        fatalError("Could not load the files needed to start the game from the bundle.")
    }
    
    func isOriginal(_ word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(_ word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(_ word: String) -> Bool {
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf8.count)
        //here it works in both utf8 and utf16 encoding?
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showError = true
    }
}

#Preview {
    ContentView()
}
