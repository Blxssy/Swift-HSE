import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        
        let tableViewController = TableViewController()
        let collectionViewController = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        tableViewController.tabBarItem = UITabBarItem(title: "Table", image: UIImage(systemName: "list.dash"), tag: 0)
        collectionViewController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "square.grid.2x2"), tag: 1)
        
        tabBarController.viewControllers = [tableViewController, collectionViewController]
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
