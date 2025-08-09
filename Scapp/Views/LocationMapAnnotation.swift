import SwiftUI

struct LocationMapAnnotation: View {
    var body: some View {
        VStack(spacing: 0){
                Image(systemName: "map.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(.accent)
                    .clipShape(Circle())
                Image(systemName: "triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 13)
                    .rotationEffect(Angle(degrees: 180))
                    .offset(y: -4)
                    .foregroundStyle(.accent)
                    .padding(.bottom, 40)
        }
    }
}

//#Preview {
//    ZStack{
//        Color.black.ignoresSafeArea()
//        LocationMapAnnotation()
//    }
//}
