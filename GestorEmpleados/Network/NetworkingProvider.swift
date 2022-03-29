
import Foundation
import Alamofire

final class NetWorkingProvider{
    static let shared = NetWorkingProvider()
    
    func getUser(api_token: String, success: @escaping (_ users: [User]) ->(), failure: @escaping (_ error: String) -> ()){
        
        let url = "http://localhost:8888/gestor-empleados/public/api/user/verPerfil"
        
        let json: Parameters = [
            "token" : api_token
        ]
        
        AF.request(url, method: .get, parameters: json).responseDecodable (of: UserResponse.self) { response in
            if let users = response.value?.user {
                success(users)
            }else{
                print("There was a problem")
            }
        }
    }
    
    func recoverPassword(introducedMail: String, success: @escaping (_ status: Int) ->(), failure: @escaping (_ error: String) -> ()){
        
        let url = URL(string:"http://localhost:8888/gestor-empleados/public/api/user/recuperarPass")!
        let json = ["email": introducedMail]
        
        AF.request(url, method: .post, parameters: json as Parameters, encoding: JSONEncoding.default, headers: nil).responseDecodable(of: Response.self){ [self]
            response in
            if let status = response.value?.status {
                success(status)
            }else{
                print("There was a problem")
            }
        }
    }
}





