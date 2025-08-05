import Foundation
import MapKit
import SwiftUI


class LocationsViewModel: ObservableObject {
   @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updateRegion(location: mapLocation)
        }
    }
    
    @Published var cameraPosition: MapCameraPosition = .camera(
        MapCamera(
            centerCoordinate: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            distance: 1200,
            heading: 0,
            pitch: 60
        )
    )
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
    }
    private func updateRegion(location: Location){
        cameraPosition = MapCameraPosition.camera(MapCamera(centerCoordinate: location.coordinates, distance: 1500, heading: 0, pitch: 45))
    }
}

