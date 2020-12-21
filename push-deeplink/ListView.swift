import SwiftUI

struct ListView: View {
    @EnvironmentObject private var screenCoordinator: ScreenCoordinator

    private let data = ["1", "2", "3", "4", "5"]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    if let id = screenCoordinator.selectedDetailId.item {
                        NavigationLink(
                            destination: DetailView(id: id),
                            isActive: $screenCoordinator.selectedDetailId.isSelected,
                            label: {
                                EmptyView()
                            })
                    }
                    ForEach(data, id: \.self) { id in
                        Button(action: {
                            screenCoordinator.selectedDetailId = Selection(isSelected: true, item: id)
                        }) {
                            Text("List \(id)")
                                .font(.title2)
                                .padding()
                        }
                    }
                }

            }
            .navigationTitle("Deeplink App")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
