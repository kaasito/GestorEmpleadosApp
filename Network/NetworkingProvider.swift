//
//  NetworkingProvider.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 28/1/22.
//

import Foundation
import Alamofire

final class NetWorkingProvider{
    var elid: Int?
    static let shared = NetWorkingProvider()
    
    
    
    
    
    
    
    func getUser(api_token: String, success: @escaping (_ users: [User]) ->(), failure: @escaping (_ error: String) -> ()){
        let url = "http://localhost:8888/gestor-empleados/public/api/user/verPerfil"
        
        let header: Parameters =
            ["token" : api_token]
        
        
        AF.request(url, method: .get, parameters: header).responseDecodable (of: UserResponse.self) { response in
            if let users = response.value?.user {
                success(users)
                for user in users {
                   
                    print(user.name)
                    
                }
            }else{
                print("sisiisi")
            }
        }
    }
    
    //        AF.request(url, method: .get, parameters: header, encoding: JSONEncoding.default).responseDecodable (of: UserResponse.self) { [self]
    //            response in
    //
    //
    //            print(response)
    //
    //            if let user = response.value{
    //                print(user)
    //            }else{
    //                print(response.error?.responseCode ?? "No error")
    //            }
    //
    //        }
}





