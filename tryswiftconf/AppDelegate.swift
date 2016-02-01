import ObjectMapper
import SwiftyJSON
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appData: AppData?

    class func app() -> AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        loadDataSource()
        return true
    }

    func loadDataSource() {
        let url = NSBundle.mainBundle().URLForResource("data", withExtension: "json")
        let jsonData = NSData(contentsOfURL: url!)
        let json = JSON(data: jsonData!)
        appData = Mapper<AppData>().map(json.dictionaryObject)!
    }
}
