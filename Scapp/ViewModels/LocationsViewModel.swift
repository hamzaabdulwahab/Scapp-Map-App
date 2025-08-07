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
    
    @Published var cameraPosition: MapCameraPosition = .camera(MapCamera(
        centerCoordinate: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), distance: 1500, heading: 0, pitch: 45))
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!

    }
    
    private func updateRegion(location: Location) {
        withAnimation {
            cameraPosition
            = .camera(
                   MapCamera(
                       centerCoordinate: location.coordinates,
                       distance: 1500,
                       heading: 0,
                       pitch: 45
                   )
               )
           }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        mapLocation = location
        showLocationsList = false
    }
}
