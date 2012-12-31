class MapController < UIViewController
  def viewDidLoad
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Map", image: nil, tag: 1)

    bundle = NSBundle.mainBundle
    plist_path = bundle.pathForResource("map", ofType: "plist")
    @map_data  = load_plist(File.read(plist_path))
    coordinate = @map_data["center"]["coordinate"]
    distance   = @map_data["center"]["distance"]

    map_view = MKMapView.alloc.initWithFrame(view.bounds)
    center_coordinate = CLLocationCoordinate2DMake(coordinate[0], coordinate[1])
    map_view.region = MKCoordinateRegionMakeWithDistance(center_coordinate, distance[0], distance[1])
    map_view.delegate = self
    map_view.addAnnotations(make_annotations(@map_data["annotations"]))
    self.view.addSubview(map_view)

    self
  end

  PIN_IDENTIFIER = "PIN"

  def mapView(map_view, viewForAnnotation: annotation)
    pin_annotation_view = map_view.dequeueReusableAnnotationViewWithIdentifier(PIN_IDENTIFIER)
    unless(pin_annotation_view)
      pin_annotation_view = MKPinAnnotationView.alloc.initWithAnnotation(annotation, reuseIdentifier: PIN_IDENTIFIER)
      pin_annotation_view.animatesDrop = true
      pin_annotation_view.pinColor = annotation.color
      pin_annotation_view.canShowCallout = true
    end

    pin_annotation_view
  end

  private
  def make_annotations(annotations)
    result = []
    annotations.each do |annotation|
      result << MapAnnotation.new(annotation)
    end
    result
  end
end
