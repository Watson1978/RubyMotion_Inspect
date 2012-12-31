class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    map_controller = MapController.alloc.initWithNibName(nil, bundle: nil)
    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    tab_controller.viewControllers = [map_controller]
    @window.rootViewController = tab_controller
    @window.makeKeyAndVisible
    true
  end
end
