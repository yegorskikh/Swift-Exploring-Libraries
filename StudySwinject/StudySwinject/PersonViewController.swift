import UIKit

class PersonViewController: UIViewController {
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        person?.play() // I'm playing with Yegor.
    }


}

