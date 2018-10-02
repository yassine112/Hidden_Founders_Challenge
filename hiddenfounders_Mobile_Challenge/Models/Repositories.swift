//
//  Repositories.swift
//  hiddenfounders_Mobile_Challenge
//
//  Created by Yassine EL HALAOUI on 02/10/2018.
//

import Foundation

struct Repositories: Decodable {

    var total_count: Int?
    var incomplete_results: Bool
    var items: [ReposItmes]?
}
