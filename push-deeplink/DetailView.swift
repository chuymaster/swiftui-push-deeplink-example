import SwiftUI

struct DetailView: View {

    @EnvironmentObject private var screenCoordinator: ScreenCoordinator

    let id: String

    var body: some View {
        VStack {
            Text("Detail \(id)")
            Divider()
            Button(action: {
                screenCoordinator.selectedDetailId = Selection(isSelected: false, item: nil)
            }){
                Text("Close")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: "1")
    }
}
