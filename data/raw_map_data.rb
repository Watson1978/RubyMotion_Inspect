data = {}
center = {
  "coordinate" => [50.846426, 4.353426],
  "distance"   => [250, 250]
}
annotations = [
  {
    "coordinate" => [50.846424, 4.353426],
    "title" => "Conference Venue",
    "color" => "red"
  },
  {
    "coordinate" => [50.846455, 4.354879],
    "title" => "Hotel Novotel Brussels off Grand Place",
    "color" => "green"
  },
  {
    "coordinate" => [50.846836, 4.355237],
    "title" => "Ibis Brussels off Grand Place",
    "color" => "green"
  },
  {
    "coordinate" => [50.845959, 4.356127],
    "title" => "Le Méridien Brussels",
    "color" => "green"
  }
]

data["center"]      = center
data["annotations"] = annotations

# generate Map data
path = File.join(File.dirname(__FILE__), "..")
File.open("#{path}/resources/map.plist", "w") { |io|
  io.print(data.to_plist)
}