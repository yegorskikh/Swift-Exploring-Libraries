import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let container: Container = {
        let container = Container()
        container.register(Animal.self) { _ in Cat(name: "Yegor") }
        container.register(Person.self) { r in
            PetOwner(pet: r.resolve(Animal.self)!)
        }
        
        container.register(PersonViewController.self) { r in
            let controller = PersonViewController()
            controller.person = r.resolve(Person.self)
            return controller
        }
        return container
    }()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let viewController = container.resolve(PersonViewController.self)
        
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }
    
    
}

