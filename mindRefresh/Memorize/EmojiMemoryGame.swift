// VIEWMODEL
// TRANSLATES MODEL TO VIEW AND VIEW TO MODEL
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Hunter Antal on 2021-10-21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    //LIST OF EMOJIS
//   private static let emojis = ["π²", "π", "π", "π", "π", "π", "π", "π", "π", "βοΈ", "π", "β΅οΈ", "πΈ", "πΆ", "π", "π", "πΊ", "π ", "π΅", "π", "π", "π", "π»", "π"]
    private static let emojis = ["π", "π", "π", "π", "π", "π", "π", "π", "π«", "π", "π", "π₯­", "π", "π₯₯", "π₯", "π₯", "π₯¦", "π₯¬", "π₯", "πΆ", "π«", "π", "π½", "π«"]
//    private static let emojis = ["πβ, βπβ, βπβ, βπβ, βπβ, βπβ, βπβ, βπβ, βπ«β, βπβ, βπβ, βπ₯­β, βπβ, βπ₯₯β, βπ₯β, βπβ, βπ₯β, βπ₯¦β, βπ₯¬β, βπ₯β, βπΆβ, βπ«β, βπ½β]

   private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
            
        }
    }
    
    @Published private var model = createMemoryGame()
        
        
    
    var cards: Array<Card>{
        model.cards
    }
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    func shuffle() {
        model.shuffle()
    }
    func restart(){
        model = EmojiMemoryGame.createMemoryGame()
    }
}
