class MapAnnotation
  def initialize(data)
    @coordinate = CLLocationCoordinate2DMake(data["coordinate"][0], data["coordinate"][1])
    @title = data["title"]
    @color = case data["color"]
    when "red"
      MKPinAnnotationColorRed
    when "green"
      MKPinAnnotationColorGreen
    when "purple"
      MKPinAnnotationColorPurple
    end
  end

  def coordinate
    @coordinate
  end

  def title
    @title
  end

  def color
    @color
  end
end