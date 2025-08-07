import SwiftUI
import MapKit
import Foundation


struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    @State var showSheet: Bool = false
    var body: some View {
        ZStack {
            Map(position: $vm.cameraPosition)
            VStack(spacing: 0){
                header
                    .onTapGesture(perform: vm.toggleLocationsList)
                    .padding()
                Spacer()
            }
           
        }
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
}
