


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

````Swift 
          class CardViewController: UIViewController, Glideable 
````

You only get one property to which you need to conform to and that is `headerHeight`. This headerHeight is the visible area for your card if you choose not to completely dismiss it and have it remain floating at the bottom of the screen. 

## Configuration of GlideUI

After you have conformed your card view controller to the `Glideable` protocol, the next thing you need to do is create another Swift file and this time conform your class to `GlideConfiguration` protocol. This protocol has 4 properties: 

````Swift
protocol GlideConfiguration : class {
    
    /// When Segmentation Enabled, you get three States
    ///Open - Max Height
    ///Compressed - Intermediate Height
    ///Closed - Min Height of the card
    var segmented: Bool { get }
    
    ///When Segmentation is ENABLED
    ///A dictionary that takes the state enum (.open, .compressed, .closed) & corresponding heights
    var segmentHeightDictionary: [State: CGFloat] { get }
    
    
    ///If Segmentation is turned OFF
    ///Assign a concrete height to the card. It can be:
    ///Fullscreen - Takes the fullscreen of the parent view
    ///Half - half of the parent view
    ///OneFourth - 1/4 of the parent view
    ///OneThird - 1/3 of the parent View
    ///Custom - Give a custom dimension and it should open till that point.

    //Concrete Dimensions only have two states - close(0 or headerHeight) or opened (selected from above options)
    var concreteDimension: GlideConcreteDimension { get }
    
    
    //To show a grey handle top indicate this is a card/ interactable
    var popUpIndicator: Bool { get }
   
}

````

### Configuration file example

````Swift
class Configuration: GlideConfiguration {
    var segmented: Bool = true
    var segmentHeightDictionary: [State : CGFloat] = [State.open : 700,
                                                      State.compressed : 300,
                                                      State.closed : 0]
    
    var concreteDimension: GlideConcreteDimension = .fullScreen
    var popUpIndicator: Bool = true
}
````

This is an example configuration file. In this configuration file, I am setting `segmented` as true and providing the `segmentheightDicitionary` a dictionary with 700px as `.open` state dimension, `.compressed` as 300 and `.closed` as 0. 

When segmentation is enabled, the `.closed` key value overrides the `headerHeight`. 

## Setting it all up 
Once the configuration file has been created, and the cardViewController conformed to `Glideable` protocol, now all you need is to create an instance of `Glide` class, initialize it like so:

````Swift
         let glideConfig = Configuration() // Glide Configuration File
         let cardController = CardViewController() // Card View Controller
          glideManager = Glide(parentViewController: self, configuration: glideConfig, card: cardController)
````

The above code goes in the parent View Controller file. 

## ScrollViews & PanGesture Support
If a card View controller contains a scroll view, as soon as the user goes to the top of the scrollView, instead of rubberbanding effect, the card collpases as it should. Got some help from this [project](https://medium.com/@phillfarrugia/re-creating-the-siri-shortcuts-drawer-interaction-9b2bc94e0b05) for this particular feature. 

## Segmentation vs No Segmentation 
If you choose to work with no segmenation, just turn it off in the configuration file. Instead, use the `concreteDimension` property and you can use some of the default dimensions such as `.fullscreen`, `.half`, `.oneFourth`, `oneThird`, and `.custom(_)`. In custom, you can add your own dimension/CGFloat. Dimensions greater than parentViewController will be defaulted to parentViewController height. 


