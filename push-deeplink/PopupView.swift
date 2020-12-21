import SwiftUI

struct PopupView: View {

    @EnvironmentObject private var screenCoordinator: ScreenCoordinator
    
    let id: String

    var body: some View {
        VStack {
            Text("Popup \(id)")
                .font(.title)
                .bold()
            Divider()
            Button(action: {
                screenCoordinator.selectedPopupId = Selection(isSelected: false, item: nil)
            }){
                Text("Close")
            }
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(id: "1")
    }
}
