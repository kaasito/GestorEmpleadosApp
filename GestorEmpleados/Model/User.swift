import Foundation

struct UserResponse: Decodable {
    var user: [User]?
}

struct User: Decodable {
    var id: Int?
    var name: String?
    var puesto: String?
    var email: String?
    var salario: Int?
    var biografia: String?
    var api_token: String?
}
