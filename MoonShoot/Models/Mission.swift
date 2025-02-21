//
//  struct CrewRole- Codable {     let name- String     let role- String }.swift
//  MoonShoot
//
//  Created by Shashank B on 14/02/25.
//

import Foundation

struct CrewRole: Codable,Equatable,Hashable {
    let name: String
    let role: String
}


struct Mission: Codable, Identifiable , Hashable {
    static func == (lhs: Mission, rhs: Mission) -> Bool {
        lhs.launchDate == rhs.launchDate
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

//Or we can do like below also its called nested struct


//struct Mission: Codable, Identifiable {
//    struct CrewRole: Codable {
//        let name: String
//        let role: String
//    }
//    let id: Int
//    let launchDate: String?
//    let crew: [CrewRole]
//    let description: String
//}
