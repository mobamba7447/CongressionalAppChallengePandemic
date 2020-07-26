import Foundation
let quote = "Here's to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes. The ones who see things differently. They're not fond of rules. And they have no respect for the status quo. You can quote them, disagree with them, glorify or vilify them. About the only thing you can't do is ignore them. Because they change things. They push the human race forward. And while some may see them as the crazy ones, we see genius. Because the people who are crazy enough to think they can change the world, are the ones who do. - Steve Jobs (Founder of Apple Inc.)"
// this is the quote from the app coda website. Let's experiment and see how the code functions in a playground
let tagger = NSLinguisticTagger(tagSchemes: [.tokenType, .language, .lexicalClass, .nameType, .lemma], options: 0)
let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
//this is the natural speech linguistic tagger. apple's api can tag parts of speech and other cool stuff
// in the tagger we have tag schemes. They are constants we call out. each of them can identify different information by analyzing the text.
//token type:out of all characters in the string, the token tpye can classify each character as a word, white space, or punctuation.
// language detects the language
//name type: this looks for names in the quote
// Lemma: Bascos example of democracy: demcratic democracy turn into demo
//options: in swift we use the colon as an establishment of the type. we are using natural speech linguistic tagger options of leaving out punctuation and whitespaec
// utilize the language scheme in this fucntion
func determineLanguage(for text: String) {
    tagger.string = text
    let language = tagger.dominantLanguage
    print("the language that is dominant is \(language!)")
}
func tokenizeText(for text: String) {
    tagger.string = text
    let range = NSRange(location: 0, length: text.utf16.count)
    tagger.enumerateTags(in: range, unit: .word, scheme: .tokenType, options: options) {
        tag, tokenRange, stop in
        let word = (text as NSString).substring(with: tokenRange)
        print(word)
    }
}
//i wonder why we put it in utf16 to just get the count of the count. I think that it is because there arre surragote pairs

determineLanguage(for: quote)
tokenizeText(for: quote)
//the functions have the quotes
