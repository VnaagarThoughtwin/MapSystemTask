# system_task_on_map

A new Flutter project.

## Getting Started

in this task, latitude and longitude are used as unique identifiers for markers instead of a unique label for the following reasons:

## Uniqueness:

Latitude and longitude coordinates provide a unique identifier for each point on the Earth's surface. This ensures that each marker on the map has a distinct and unique identifier.

# Precision:

Coordinates offer a high level of precision SQlite, making them suitable for accurate positioning on a map. Labels, on the other hand, might not be unique or precise enough, especially when dealing with locations close to each other.

# Consistency:

Coordinates are consistent and language-independent. They can be easily used across different systems and platforms without the need for translation.

# Efficiency:

Using latitude and longitude directly simplifies the process of interacting with map APIs and performing spatial calculations.

By using latitude and longitude as unique identifiers, the app ensures that markers are uniquely identified, accurately placed on the map, and easily shareable across different devices and systems.

##  Here we used
path_provider: To get the path of the Database Dir
sqflite: To Local database to store Marker & Table information
google_maps_flutter: Maps
provider: To state management
