import UIKit
import Alamofire

class NetworkReachability {
    public static let shared = NetworkReachability()
    private init() {}
    let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
    let offlineAlertController: UIAlertController = {
        let alert = UIAlertController(title: "No Network", message: "Please connect to network and try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        return alert
    }()
    
    func startNetworkMonitoring() {
        reachabilityManager?.startListening { status in
            switch status {
            case .notReachable:
                self.showOfflineAlert()
            case .reachable(.cellular):
                self.dismissOfflineAlert()
            case .reachable(.ethernetOrWiFi):
                self.dismissOfflineAlert()
            case .unknown:
                print("Unknown network state")
            }
        }
    }
    
    func showOfflineAlert() {
        let rootViewController = UIApplication.shared.windows.first?.rootViewController
//        let storyboard = UIStoryboard(name: "main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "NetworkViewController") as! NetworkViewController
        let controller = UIHostingController(rootView: NetworkErrorView())
        controller.modalPresentationStyle = .overFullScreen
        rootViewController?.present(controller, animated: true, completion: nil)
    }
    
    func dismissOfflineAlert() {
        let rootViewController = UIApplication.shared.windows.first?.rootViewController
        rootViewController?.dismiss(animated: true, completion: nil)
    }
}

import SwiftUI
public struct MonitorNetwork: ViewModifier {
  
  public func body(content: Content) -> some View {
      content.onAppear {
          NetworkReachability.shared.startNetworkMonitoring()
      }
  }
}

extension View {
    public var monitorNetwork: some View {
    modifier(MonitorNetwork())
  }
}
