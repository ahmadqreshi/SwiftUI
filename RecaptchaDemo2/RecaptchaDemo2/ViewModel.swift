import Foundation

@MainActor class ViewModel: ObservableObject {
    
    private var recaptchaClient: RecaptchaClient?
    
    init() {
        Task {
            let (recaptchaClient, error) = await Recaptcha.getClient(
                siteKey: "6Ld6lH8jAAAAAPzyj0ujFMstJgJPqSM22VJJ579l")
            if let recaptchaClient = recaptchaClient {
                self.recaptchaClient = recaptchaClient
            }
            if let error = error {
                print("RecaptchaClient creation error: \(error).")
            }
        }
    }
    
    func execute() {
        guard let client = self.recaptchaClient else {
            print("Client not initialized correctly.")
            return
        }
        
        Task {
            let (token, error) = await client.execute(
                RecaptchaAction(action: .login))
            if let token = token {
                print(token.recaptchaToken)
            } else {
                print(error ?? "")
            }
        }
    }
}
