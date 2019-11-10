//
//  KFPhoto.swift
//  SKPhotoBrowser-Kingfisher
//
//  Created by Will on 2018/5/28.
//  Copyright © 2018 Will. All rights reserved.
//

import Kingfisher
import SKPhotoBrowser
import UIKit

open class KFPhoto: NSObject, SKPhotoProtocol {
    // MARK: - SKPhotoProtocol

    open var index: Int = 0
    open var underlyingImage: UIImage!
    open var caption: String?
    open var contentMode: UIView.ContentMode = .scaleAspectFill

    open var shouldCachePhotoURLImage: Bool = true
    open var photoURL: String!

    // MARK: - init

    public override init() {
        super.init()
    }

    public convenience init(image: UIImage) {
        self.init()
        underlyingImage = image
    }

    public convenience init(url: String) {
        self.init()
        photoURL = url
    }

    public convenience init(url: String, holder: UIImage?) {
        self.init()
        photoURL = url
        underlyingImage = holder
    }

    // MARK: - SKPhotoProtocol

    open func checkCache() {
        guard let photoURL = photoURL else {
            return
        }
        guard shouldCachePhotoURLImage else {
            return
        }

        if ImageCache.default.isCached(forKey: photoURL) == true {
            ImageCache.default.retrieveImage(forKey: photoURL) { [weak self] result in
                guard let `self` = self else { return }
                switch result {
                case let .success(value):
                    self.underlyingImage = value.image
                case let .failure(error):
                    print(error)
                }
            }
        }
    }

    open func loadUnderlyingImageAndNotify() {
        guard photoURL != nil, let URL = URL(string: photoURL) else { return }

        // Fetch Image
        ImageDownloader.default.downloadImage(with: URL) { result in
            switch result {
            case let .success(value):
                print(value.image)
                DispatchQueue.main.async {
                    self.loadUnderlyingImageComplete()
                }
                if self.shouldCachePhotoURLImage {
                    ImageCache.default.store(value.image, original: value.originalData, forKey: self.photoURL, toDisk: true)
                }
            case let .failure(error):
                print(error)
                DispatchQueue.main.async {
                    self.loadUnderlyingImageComplete()
                }
            }
        }
    }

    open func loadUnderlyingImageComplete() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: SKPHOTO_LOADING_DID_END_NOTIFICATION), object: self)
    }
}
