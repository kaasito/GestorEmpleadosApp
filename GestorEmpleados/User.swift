import Foundation

struct UserResponse: Decodable {
    var user: [User]?
}

struct User: Decodable, Encodable {
    var id: Int?
    var name: String?
    var puesto: String?
    var email: String?
    var salario: Int?
    var biografia: String?
    var api_token: String?
}

//            "id": 3,
//            "name": "Juan x",
//            "puesto": "empleado",
//            "email": "lukitas@gmail.com",
//            "email_verified_at": null,
//            "salario": 3,
//            "biografia": "sinosino",
//            "api_token": null,
//            "created_at": "2022-01-25T10:00:43.000000Z",
//            "updated_at": "2022-01-26T11:01:18.000000Z"
