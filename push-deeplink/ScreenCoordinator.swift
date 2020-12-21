import SwiftUI

final class ScreenCoordinator: ObservableObject {
    @Published var selectedTab: Int = 0
    @Published var selectedPopupId = Selection<String>(isSelected: false, item: nil)
    @Published var selectedDetailId = Selection<String>(isSelected: false, item: nil)
}

struct Selection<T> {
  var isSelected = false
  var item: T?
}
