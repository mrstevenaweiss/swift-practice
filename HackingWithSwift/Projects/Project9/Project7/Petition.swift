//
//  Petition.swift
//  Project7
//
//  Created by steven weiss on 5/6/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
