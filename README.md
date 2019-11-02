# GlideUI
GlideUI - Get interactive card based UI in your apps.

I wanted to create an interactive card based UI that is extremely easy to set up and fully customizable. This is my take on such a UI design element. 

I am not using Storyboards and setting a UIWindow inside SceneDelegate. So make sure to update the SceneDelegate file:  

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
          guard let winScene = (scene as? UIWindowScene) else { return }
          
          let vc = ViewController()
          window = UIWindow(windowScene: winScene)
          window?.rootViewController = UINavigationController(rootViewController: vc)
          window?.makeKeyAndVisible()
}
````

## Set Up of ViewControllers 

You should have two view controllers. One is the main View controller or parentVC and the other should be a Card viewcontroller. This card view controller should be conformed to a protocol `Glideable`. 
