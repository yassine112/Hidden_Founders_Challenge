//
//  Extensions.swift
//  hiddenfounders_Mobile_Challenge
//
//  Created by Yassine EL HALAOUI on 02/10/2018.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {

    func loadImageUsingCachWith(_ urlString: String) {
        self.image = nil

        // check cache for image
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }

        // DownLoad image
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                if err != nil {
                    print(err.debugDescription)
                    return
                }

                DispatchQueue.main.async {
                    if let downloadedImage = UIImage(data: data!) {
                        imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                        self.image = downloadedImage
                    }
                }
            }.resume()
        }
    }
}

extension Date {
    static func getPreviusMonthDate() -> String {
        guard let date = Calendar.current.date(byAdding: .day, value: -30, to: Date()) else { return "" }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
