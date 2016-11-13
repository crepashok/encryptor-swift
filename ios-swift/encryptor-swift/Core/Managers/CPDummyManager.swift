//
//  CPDummyManager.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/13/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import Foundation

class CPDummyManager {
    
    private static let quotes = Array(arrayLiteral:
        "Always remember that you are absolutely unique. Just like everyone else.",
        "If you haven't got anything nice to say about anybody, come sit next to me.",
        "Do not take life too seriously. You will never get out of it alive.",
        "No man has a good enough memory to be a successful liar.",
        "A woman's mind is cleaner than a man's: She changes it more often.",
        "People who think they know everything are a great annoyance to those of us who do.",
        "Go to Heaven for the climate, Hell for the company.",
        "We are all here on earth to help others; what on earth the others are here for I don't know.",
        "Get your facts first, then you can distort them as you please.",
        "I can resist everything except temptation.",
        "Wine is constant proof that God loves us and loves to see us happy.",
        "Too much agreement kills a chat.",
        "I'm sorry, if you were right, I'd agree with you.",
        "A day without sunshine is like, you know, night.",
        "I love deadlines. I like the whooshing sound they make as they fly by."
    )
    
    class func getRandomQuote() -> String {
        let randomQuote = quotes[Int(arc4random_uniform(14))]
        
        return randomQuote
    }
}
