import Foundation
import ObjectMapper

struct AppData: Mappable {
    var talks: [Talk]?

    init?(_ map: Map) {}

    mutating func mapping(map: Map) {
        talks <- map["talks"]
    }
}

struct Talk: Mappable {
    var date: String?
    var time: String?
    var title: String?
    var speaker: String?

    init?(_ map: Map) {}

    mutating func mapping(map: Map) {
        date <- map["date"]
        time <- map["time"]
        title <- map["title"]
        speaker <- map["speaker"]
    }
}
