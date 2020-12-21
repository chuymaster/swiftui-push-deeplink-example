import SwiftUI

struct RootView: View {

    @EnvironmentObject private var screenCoordinator: ScreenCoordinator

    var body: some View {
        TabView(selection: $screenCoordinator.selectedTab) {
            ListView()
                .tabItem {
                  VStack {
                    Image(systemName: "house")
                    Text("ホーム")
                  }
                }.tag(0)

            SettingView()
                .tabItem {
                  VStack {
                    Image(systemName: "gearshape")
                    Text("設定")
                  }
                }.tag(1)
        }
        .sheet(isPresented: $screenCoordinator.selectedPopupId.isSelected) {
            PopupView(id: screenCoordinator.selectedPopupId.item!)
        }
        .onOpenURL(perform: { url in
            if let deeplink = url.getDeeplink() {
                switch deeplink {
                case .tab(let index):
                    // タブを選択
                    screenCoordinator.selectedTab = index
                case .popup(let id):
                    // 画面をモーダルで表示
                    screenCoordinator.selectedPopupId = Selection(isSelected: true, item: id)
                case .detail(let id):
                    // プッシュ遷移で表示
                    screenCoordinator.selectedTab = 0
                    screenCoordinator.selectedPopupId = Selection(isSelected: false, item: nil)
                    screenCoordinator.selectedDetailId = Selection(isSelected: false, item: nil)
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                        screenCoordinator.selectedDetailId = Selection(isSelected: true, item: id)
                    }
                }
            }
        })
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
