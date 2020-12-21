import Foundation

extension URL {
    enum Deeplink {
        case tab(index: Int)
        case popup(id: String)
        case detail(id: String)
    }

    func getDeeplink() -> Deeplink? {
        guard self.scheme == "deeplink",
              let host = self.host,
              let queryUrlComponents = URLComponents(string: self.absoluteString) else {
            return nil
        }

        switch host {
        case "tab":
            if let indexString = queryUrlComponents.getParameterValue(for: "index"),
               let index = Int(indexString) {
                return Deeplink.tab(index: index)
            }
        case "popup":
            if let id = queryUrlComponents.getParameterValue(for: "id") {
                return Deeplink.popup(id: id)
            }
        case "detail":
            if let id = queryUrlComponents.getParameterValue(for: "id") {
                return Deeplink.detail(id: id)
            }
        default:
            return nil
        }
        return nil
    }
}

extension URLComponents {
    func getParameterValue(for parameter: String) -> String? {
        self.queryItems?.first(where: { $0.name == parameter })?.value
    }
}
