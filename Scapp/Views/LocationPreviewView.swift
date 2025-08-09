import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    var body: some View {
        HStack(alignment: .bottom, spacing: 16.0){
            VStack(alignment: .leading, spacing: 16.0){
                imageSection
                titleSection
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8.0){
              learnMoreBtn
               nextBtn
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.thinMaterial)
                .offset(y: 70)
        )
        .cornerRadius(10.0)        
    }
}

//#Preview {
////    ZStack{
////        Color.orange.ignoresSafeArea()
//        LocationPreviewView(location: LocationsDataService.locations.first!)
////    }
//}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack{
            Image(location.imageNames.first!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(10.0)
        }
        .padding(.all, 8)
        .background(Color.white)
        .cornerRadius(10.0)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4.0){
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    private var learnMoreBtn: some View {
        Button {
            vm.showLocationPreviewSheet = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 130, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextBtn: some View {
        Button {
            vm.nextBtnPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 130, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
