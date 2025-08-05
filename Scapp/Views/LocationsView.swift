import SwiftUI
import MapKit
import Foundation


struct LocationsView: View {
    @EnvironmentObject var vm: LocationsViewModel
    var body: some View {
        ZStack {
            Map(position: $vm.cameraPosition) {
                //
            }
            VStack(spacing: 0){
                header
                    .padding()
                Spacer()
            }
           
        }
    }
}

//#Preview {
//    LocationsView()
//        .environmentObject(LocationsViewModel())
//}

extension LocationsView {
    var header: some View  {
            Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                .font(.title)
                .fontWeight(.black)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.ultraThickMaterial)
                .overlay(alignment: .leading, content: {
                    Image(systemName: "arrow.up")
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundStyle(.primary)
                        .padding()
                })
                .cornerRadius(10.0)
                .shadow(color: Color.black.opacity(0.6), radius: 10.0, x: 0.0, y: 10.0)
    }
}
