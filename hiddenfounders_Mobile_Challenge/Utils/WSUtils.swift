//
//  Constants.swift
//  hiddenfounders_Mobile_Challenge
//
//  Created by Yassine EL HALAOUI on 02/10/2018.
//

import Foundation

class WSUtils {

    static var shared = WSUtils()

    private var endPointUrl = "https://api.github.com/search/repositories?q=created:%3E\(Date.getPreviusMonthDate())&sort=stars&order=desc"

    func getRepositories(completion: @escaping (Repositories) -> Void) {
        print(endPointUrl)
        self.callReposWS(completion)
    }

    func getRepositories(withPage: Int, completion: @escaping (Repositories) -> Void) {
        endPointUrl += "&page=\(withPage)"
        self.callReposWS(completion)
    }

    private func callReposWS(_ completion: @escaping (Repositories) -> Void) {
        guard let url = URL(string: self.endPointUrl) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }

            do {

                completion(try JSONDecoder().decode(Repositories.self, from: data))

            } catch let exception {
                print(exception.localizedDescription)
            }
            }.resume()
    }

}
