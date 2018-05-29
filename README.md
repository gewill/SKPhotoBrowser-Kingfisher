# SKPhotoBrowser-Kingfisher

[![Version](https://img.shields.io/cocoapods/v/SKPhotoBrowser-Kingfisher.svg?style=flat)](http://cocoapods.org/pods/SKPhotoBrowser-Kingfisher)
[![Build Status](https://travis-ci.org/AvdLee/SKPhotoBrowser-Kingfisher.svg?style=flat&branch=master)](https://travis-ci.org/AvdLee/SKPhotoBrowser-Kingfisher)
[![Language](https://img.shields.io/badge/language-swift4.1-f48041.svg?style=flat)](https://developer.apple.com/swift)
[![License](https://img.shields.io/cocoapods/l/SKPhotoBrowser-Kingfisher.svg?style=flat)](http://cocoapods.org/pods/SKPhotoBrowser-Kingfisher)
[![Platform](https://img.shields.io/cocoapods/p/SKPhotoBrowser-Kingfisher.svg?style=flat)](http://cocoapods.org/pods/SKPhotoBrowser-Kingfisher)
[![Twitter](https://img.shields.io/badge/twitter-@gewill_org-blue.svg?style=flat)](http://twitter.com/gewill_org)

## Usage

### Example project
To run the example project, clone the repo, and run `pod install` from the Example directory first. It includes sample code and unit tests.

Just like use `SKPhoto`, we use `KFPhoto` . Because SKPhotoBrowser use `var photos: [SKPhotoProtocol]` , we can switch to `KFPhoto` easily. Of course you can use your custom photo that comfirm  `SKPhotoProtocol` too.

```swift
	// 1. default use SKPhoto
    var images = [SKPhoto]()
    for url in urls {
        let photo = SKPhoto.photoWithImageURL(url)
        photo.shouldCachePhotoURLImage = true // you can use image cache by true(NSCache)
        images.append(photo)
    }
```



```swift
    // 2. use KFPhoto by SKPhotoBrowser-Kingfisher
    var images = [KFPhoto]()
    for (index, url) in urls.enumerated() {
        let holder = ImageCache.default.retrieveImageInDiskCache(forKey: middlePics[index])
        let photo = KFPhoto(url: url, holder: holder)
        images.append(photo)
    }
```



## Installation

### CocoaPods
SKPhotoBrowser-Kingfisher is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SKPhotoBrowser-Kingfisher"
```

## Author

Ge Will

Mail: [531sunlight@gmail.com](mailto:531sunlight@gmail.com)  
Home: [https://gewill.org/](https://gewill.org/)  
Twitter: [@gewill_org](https://www.twitter.com/gewill_org)
## License

SKPhotoBrowser-Kingfisher is available under the MIT license. See the LICENSE file for more info.
