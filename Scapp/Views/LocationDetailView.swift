import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location

    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.7), radius: 20.0, x: 0.0, y: 7.0)
                
                VStack(alignment: .leading, spacing: 16.0){
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .background(.ultraThinMaterial)
        .ignoresSafeArea()
        .overlay(alignment: .topLeading){
            backBtn
        }
    }
}

//#Preview {
//    LocationDetailView(location: LocationsDataService.locations.first!)
//}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                
            }
        }
        .frame(height: 500)
        .tabViewStyle(.page)
        
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(location.name)
                .font(.title)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fontWeight(.medium)
            if let url: URL = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                
            }
        }
    }
    
    private var mapLayer: some View {
        Map(position: .constant(MapCameraPosition.camera(.init(centerCoordinate: location.coordinates, distance: 1500, heading: 0.0, pitch: 45.0)))) {
            Annotation(location.name, coordinate: location.coordinates) {
                LocationMapAnnotation()
            }
        }
        .aspectRatio(1.0, contentMode: .fit)
        .cornerRadius(30)
        .allowsHitTesting(false)
    }
    
    private var backBtn: some View {
        Button {
            vm.showLocationPreviewSheet = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundStyle(Color.primary)
                .padding()
                .background(.thickMaterial)
                .cornerRadius(10.0)
                .padding()
                .shadow(color: Color.black.opacity(0.5), radius: 10.0)
        }

    }
}
