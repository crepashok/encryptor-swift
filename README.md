# encryptor-swift

[![CI Status](http://img.shields.io/travis/crepashok/encryptor-swift.svg?style=flat)](https://travis-ci.org/crepashok/encryptor-swift)

## Features

- [x] Generate random Quote ([Here you can find full list](http://www.brainyquote.com/quotes/topics/topic_funny.html?SPvm=1&vm=l))
- [x] Encrypt generated Quote with AES 256 and RSA 2048
- [x] For AES 256 was generated random key and stored it in keychain
- [x] For AES 256 was developed settings page, where is displayed stored in keychain encryption key
- [x] For RSA 2048 was generated public and private keys from keychain and result was putted in project folder, all data are encrypted with them


## Requirements

- iOS 9.0+
- Xcode 8.0+
- Swift 3.0+


## Used Frameworks

- [x] [KeychainSwift (7.0)](https://github.com/marketplacer/keychain-swift)
- [x] [CryptoSwift (0.6)](https://github.com/krzyzanowskim/CryptoSwift)
- [x] [SwiftyRSA (0.5)](https://github.com/TakeScoop/SwiftyRSA)


## License

Alamofire is released under the MIT license. See LICENSE for details.
