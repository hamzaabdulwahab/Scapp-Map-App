import SwiftUI
import MapKit

struct LocationsListView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        
        List{
            ForEach(vm.locations) { location in
                listRowView(location: location)
                    .listRowBackground(Color.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("Tapped")
                        vm.showNextLocation(location: location)
                    }
                //
                //                }
            }
        }
        .listStyle(.plain)
    }
}

//#Preview {
//    LocationsListView()
//        .environmentObject(LocationsViewModel())
//}

extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            if let locationImage = location.imageNames.first {
                Image(locationImage)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(10.0)
                    .frame(width: 50, height: 50)
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                Text(location.cityName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.secondary)
            }
            .padding(.leading, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 4)
    }
}

