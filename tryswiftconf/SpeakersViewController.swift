import UIKit

class SpeakersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Speakers"
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
        let appData = AppDelegate.app().appData!
        let speaker = appData.speakers![indexPath.row]

        cell.textLabel?.text = speaker.name
        cell.detailTextLabel?.text = speaker.twitter

        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.app().appData!.speakers!.count
    }
}
