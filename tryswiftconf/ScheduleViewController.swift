import ObjectMapper
import SwiftyJSON
import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var appData: AppData!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Schedule"
        loadDataSource()
    }

    func loadDataSource() {
        let url = NSBundle.mainBundle().URLForResource("data", withExtension: "json")
        let jsonData = NSData(contentsOfURL: url!)
        let json = JSON(data: jsonData!)
        appData = Mapper<AppData>().map(json.dictionaryObject)!
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "TalkIdentifier")
        let talk = appData.talks![indexPath.row]

        cell.textLabel?.text = talk.title == "" ? talk.speaker : talk.title
        cell.detailTextLabel?.text = talk.speaker == "" ? talk.time! : talk.time! + " – " + talk.speaker!

        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (appData.talks?.count)!
    }
}