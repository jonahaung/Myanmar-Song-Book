//
//  CreaterTextView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import UIKit

final class CreaterTextView: UITextView {
    
    private lazy var toolBar = ToolbarInputAccessory()
    private var tags = [XTag]()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configureToolbar()
        bounces = true
        alwaysBounceVertical = true
        keyboardDismissMode = .interactive
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureToolbar() {
        toolBar.configure(textView: self)
    }
    
    func detectChords() {
        self.tags.removeAll()
        text.enumerateSubstrings(in: text.startIndex..<text.endIndex, options: .byLines) {
            (substring, substringRange, _, _) in
            if let substring = substring {
                let nsRange = NSRange(substringRange, in: self.text)
                let string = String(substring)
                let tag = XTag.init(string: string, range: nsRange, font: XFont.body(for: string).withSize(UIFont.systemFontSize))
                self.tags.append(tag)
            }
        }
        
        RegularExpression.chordPattern.enumerateMatches(in: text, range: text.nsRange()) { result, _, _ in
            if let result = result {
                let range = result.range
                let str = (text as NSString).substring(with: range)
                let tag = XTag(string: String(str), range: range, font: XFont.chord().withSize(UIFont.systemFontSize), foregroundColor: .systemCyan)
                self.tags.append(tag)
            }
        }
        RegularExpression.chordsRegexForPlainText.enumerateMatches(in: text, range: text.nsRange()) { result, _, _ in
            if let result = result {
                let range = result.range
                let str = (text as NSString).substring(with: range)
                let tag = XTag(string: String(str), range: range, font: XFont.chord().withSize(UIFont.systemFontSize), foregroundColor: .systemCyan)
                self.tags.append(tag)
            }
        }
        self.tags.forEach {
            textStorage.addAttributes($0.attributes, range: $0.range)
        }
    }
    
    func insert(text: String) {
        insertText(text.newLine)
        scrollToBottom()
    }
    
    func scrollToBottom() {
        let length = attributedText.string.utf16.count
        let range = NSMakeRange(length-1, 0)
        scrollRangeToVisible(range)
        selectedTextRange = self.textRange(from: endOfDocument, to: endOfDocument)
    }
}

import SwiftUI

extension CreaterTextView {
    
    struct SwiftUIView: UIViewRepresentable {
        
        
        @EnvironmentObject private var viewModel: CreaterViewModel
        
        func makeUIView(context: Context) -> CreaterTextView {
            let view = CreaterTextView()
            view.delegate = context.coordinator
            viewModel.textView = view
            return view
        }
        func updateUIView(_ uiView: CreaterTextView, context: Context) {
            uiView.detectChords()
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(text: $viewModel.song.rawText)
        }
        class Coordinator: NSObject, UITextViewDelegate {
            private var text: Binding<String>
            init(text: Binding<String>) {
                self.text = text
            }
            
            func textViewDidChange(_ textView: UITextView) {
                text.wrappedValue = textView.text
            }
        }
    }
}
let withChords = """
[C][Am][F][G]
[C]တရားမျှတ [Am]လွတ်လပ်ခြင်းနဲ့မသွေ၊
တို့ပြည်၊ [F]တို့မြေ၊[G]
[C]များလူခပ်သိမ်း၊ [Am]ငြိမ်းချမ်းစေဖို့၊[G]
ခွင့်တူညီမျှ၊ [F]ဝါဒဖြူစင်တဲ့ပြည်၊[F][G]
တို့ပြည်၊ [C]တို့မြေ၊
ပြည်[Am]ထောင်စုအမွေ၊ [G]အမြဲတည်တံ့စေ၊[F][Am]
[C]အဓိဋ္ဌာန်ပြုပေ၊ [G]ထိန်း[F]သိမ်းစို့လေ[Am]

ကမ္ဘာမကျေ၊[G] မြန်မာပြည်၊[Am][C][G]
[Am]တို့ဘိုးဘွား [C]အမွေစစ်မို့ [G]ချစ်မြတ်နိုးပေ။
ပြည်ထောင်စုကို [Dm]အသက်ပေးလို့ [Am]တို့ကာကွယ်မလေ၊[C][F][G]
ဒါတို့ပြည် [An]ဒါတို့မြေ [C]တို့ပိုင်နက်မြေ။[F]
[C]တို့ပြည် တို့မြေ [F]အကျိုးကို [G]ညီညာစွာတို့တစ်တွေ[Am]
[F]ထမ်းဆောင်ပါစို့လေ [G]တို့တာဝန်ပေ အဖိုးတန်မြေ။[C]

[C][Am][F][G]
[C]တရားမျှတ [Am]လွတ်လပ်ခြင်းနဲ့မသွေ၊
တို့ပြည်၊ [F]တို့မြေ၊[G]
[C]များလူခပ်သိမ်း၊ [Am]ငြိမ်းချမ်းစေဖို့၊[G]
ခွင့်တူညီမျှ၊ [F]ဝါဒဖြူစင်တဲ့ပြည်၊[F][G]
တို့ပြည်၊ [C]တို့မြေ၊
ပြည်[Am]ထောင်စုအမွေ၊ [G]အမြဲတည်တံ့စေ၊[F][Am]
[C]အဓိဋ္ဌာန်ပြုပေ၊ [G]ထိန်း[F]သိမ်းစို့လေ[Am]

ကမ္ဘာမကျေ၊[G] မြန်မာပြည်၊[Am][C][G]
[Am]တို့ဘိုးဘွား [C]အမွေစစ်မို့ [G]ချစ်မြတ်နိုးပေ။
ပြည်ထောင်စုကို [Dm]အသက်ပေးလို့ [Am]တို့ကာကွယ်မလေ၊[C][F][G]
ဒါတို့ပြည် [An]ဒါတို့မြေ [C]တို့ပိုင်နက်မြေ။[F]
[C]တို့ပြည် တို့မြေ [F]အကျိုးကို [G]ညီညာစွာတို့တစ်တွေ[Am]
[F]ထမ်းဆောင်ပါစို့လေ [G]တို့တာဝန်ပေ အဖိုးတန်မြေ။[C]
"""
//let hotelCalifornia = """
//[Verse 1]
//Am                        E7
//On a dark desert highway, cool wind in my hair
//G                     D
//Warm smell of colitas rising up through the air
//F                         C
//Up ahead in the distance, I saw a shimmering light
//Dm
//My head grew heavy and my sight grew dim,
//E
//I had to stop for the night
//
//[Verse 2]
//Am                              E7
//There she stood in the doorway, I heard the mission bell
//G
//And I was thinking to myself
//             D
//This could be heaven or this could be hell
//F                         C
//Then she lit up a candle, and she showed me the way
//Dm
//There were voices down the corridor,
//E7
//I thought I heard them say...
//
//[Chorus]
//F                         C
//Welcome to the Hotel California
//      E7                                         Am
//Such a lovely place (such a lovely place), such a lovely face
//F                                       C
//There's plenty of room at the Hotel California
//   Dm                                       E7
//Any time of year, (any time of year) You can find it here...
//
//[Verse 3]
//Am                           E7
//Her mind is Tiffany twisted, She got the Mercedes bends
//G                                   D
//She got a lot of pretty pretty boys that she calls friends
//F                                 C
//How they danced in the courtyard, sweet summer sweat
//Dm                      E7
//Some dance to remember, some dance to forget
//
//[Verse 4]
//Am                           E7
//So I called up the captain; "Please bring me my wine" (he said)
//G                                     D
//"We haven't had that spirit here since 1969"
//F                                       C
//And still those voices are calling from far away
//Dm
//Wake you up in the middle of the night
//E7
//Just to hear them say...
//
//[Chorus]
//F                         C
//Welcome to the Hotel California
//      E7                                         Am
//Such a lovely place (such a lovely place), such a lovely face
//       F                             C
//They're livin' it up at the Hotel California
//      Dm                                               E7
//What a nice surprise (what a nice surprise), bring your alibis
//
//[Verse 5]
//Am                      E7
//Mirrors on the ceiling, the pink champagne on ice (and she said)
//G                               D
//We are all just prisoners here, of our own device
//F                             C
//And in the master's chambers, they gathered for the feast
//Dm
//They stab it with their steely knives, but they
//E7
//Just can't kill the beast
//
//[Verse 6]
//Am                           E7
//Last thing I remember, I was running for the door
//G                                     D
//I had to find the passage back to the place I was before
//F                                   C
//"Relax" said the night man, "we are programmed to receive,
//Dm
//You can check out any time you like
//E7
//But you can never leave"
//
//[Outro]
//Am E7 G D7 F C Dm E7  x5
//"""
