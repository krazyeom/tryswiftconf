import ObjectMapper
import SwiftyJSON
import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Schedule"
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TalkIdentifier", forIndexPath: indexPath) as! TableCell
        let appData = AppDelegate.app().appData!
        let talk = appData.talks![indexPath.row]

      
        cell.titleText?.text = talk.title == nil ? talk.speaker : talk.title
        cell.subtitleText?.text = talk.time!
        cell.subtitleText?.textColor = .darkGrayColor()
        var imageName = talk.title == nil ? talk.speaker?.stringByReplacingOccurrencesOfString(" ", withString: "") : "coffee"
        if imageName == "BorisBügling" {
            imageName = "BorisBugling"
        }
        cell.speakerImage.image = UIImage(imageLiteral: imageName!)
      
        return cell
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "WEDNESDAY, MARCH 2ND"
        case 1: return "THURSDAY, MARCH 3RD"
        case 2: return "FRIDAY, MARCH 4TH"
        default: return nil
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.app().appData!.numberOfTalksOnDay(section)
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
