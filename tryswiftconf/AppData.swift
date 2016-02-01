import Foundation
import ObjectMapper

struct AppData: Mappable {
    var talks: [Talk]?
    var speakers: [Speaker]?

    init?(_ map: Map) {}

    mutating func mapping(map: Map) {
        talks <- map["talks"]
        speakers <- map["speakers"]
    }

    func numberOfTalksOnDay(day: Int) -> Int {
        guard let _talks = talks?.filter({ (talk) -> Bool in
            switch day {
            case 0: return talk.date == "Wednesday, March 2nd"
            case 1: return talk.date == "Thursday, March 3rd"
            case 2: return talk.date == "Friday, March 4th"
            default: return false
            }
        }) else {
            return 0
        }

        return _talks.count
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

struct Speaker: Mappable {
    var name: String?
    var twitter: String?
    var intro: String?

    init?(_ map: Map) {}

    mutating func mapping(map: Map) {
        name <- map["name"]
        twitter <- map["twitter"]
        intro <- map["intro"]
    }
}
