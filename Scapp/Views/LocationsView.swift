import SwiftUI
import MapKit
import Foundation


struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        ZStack {
            // background layer
            mapLayer
            
            // foreground layer
            VStack(spacing: 0){
                header
                    .onTapGesture(perform: vm.toggleLocationsList)
                Spacer()
                locationPreviewView
            }
            .padding()
            
        }
        .sheet(item: $vm.showLocationPreviewSheet, onDismiss: nil){ location in LocationDetailView(location: location)
        }
        .animation(.easeOut, value: vm.mapLocation)
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View  {
        VStack {
            
            Button {
                vm.toggleLocationsList()
            } label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading, content: {
                        Image(systemName:
                                "arrow.up")
                        .font(.headline)
                        .fontWeight(.black)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    })
            }
            .foregroundStyle(.primary)
            
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(vm.showLocationsList ? .thinMaterial : .thickMaterial)
        .cornerRadius(10.0)
        .shadow(color: Color.black.opacity(0.6), radius: 10.0, x: 0.0, y: 10.0)
        
    }
    
    private var locationPreviewView: some View {
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(radius: 10.0)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
    
    private var mapLayer: some View {
        Map(position: $vm.cameraPosition) {
            ForEach(vm.locations){location in
                Annotation(location.name, coordinate: location.coordinates) {
                    LocationMapAnnotation()
                        .scaleEffect(
                            vm.mapLocation == location ?
                            1.0 : 0.6
                        )
                        .onTapGesture{
                            vm.showNextLocation(location: location)
                        }
                }
            }
        }
    }
}



