import Foundation
import Capacitor
import Contacts
import AuthenticationServices

@objc(ContactsPlugin)
@available(iOS 12.0, *)
public class ContactsPlugin: CAPPlugin {

    var webAuthSession: ASWebAuthenticationSession?
    
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.success([
            "value": value
        ])
    }

    @objc func getContacts(_ call: CAPPluginCall) {
        let authURL = URL(string: "https://github.com/login/oauth/authorize?client_id=<client_id>")
            let callbackUrlScheme = "octonotes://auth"

            self.webAuthSession = ASWebAuthenticationSession.init(url: authURL!, callbackURLScheme: callbackUrlScheme, completionHandler: { (callBack:URL?, error:Error?) in

                // handle auth response
                guard error == nil, let successURL = callBack else {
                    return
                }

                let oauthToken = NSURLComponents(string: (successURL.absoluteString))?.queryItems?.filter({$0.name == "code"}).first

                // Do what you now that you've got the token, or use the callBack URL
                print(oauthToken ?? "No OAuth Token")
            })

            // Kick it off
            self.webAuthSession?.start()
//        let value = call.getString("filter") ?? ""
//        // You could filter based on the value passed to the function!
//
//        let contactStore = CNContactStore()
//        var contacts = [Any]()
//        let keys = [
//                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
//                        CNContactPhoneNumbersKey,
//                        CNContactEmailAddressesKey
//                ] as [Any]
//        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
//
//        contactStore.requestAccess(for: .contacts) { (granted, error) in
//            if let error = error {
//                print("failed to request access", error)
//                call.reject("access denied")
//                return
//            }
//            if granted {
//               do {
//                   try contactStore.enumerateContacts(with: request){
//                           (contact, stop) in
//                    contacts.append([
//                        "firstName": contact.givenName,
//                        "lastName": contact.familyName,
//                        "telephone": contact.phoneNumbers.first?.value.stringValue ?? ""
//                    ])
//                   }
//                   print(contacts)
//                   call.success([
//                       "results": contacts
//                   ])
//               } catch {
//                   print("unable to fetch contacts")
//                   call.reject("Unable to fetch contacts")
//               }
//            } else {
//                print("access denied")
//                call.reject("access denied")
//            }
//        }
    }
}
