
import SwiftUI
import WebKit

struct WebKitView: UIViewRepresentable {
    
    @Binding var isLoad: Bool

    func makeUIView(context: Context) -> some UIView {
        let req = URLRequest(url: URL(string: "https://apple.com")!)
        return {
            $0.load(req)
            $0.navigationDelegate = context.coordinator
            return $0
        }(WKWebView())
      
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}


class Coordinator: NSObject, WKNavigationDelegate {
    
    var parent: WebKitView
    
    init(parent: WebKitView) {
        self.parent = parent
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        parent.isLoad = true
    }
}
