
import Foundation


struct Response: Decodable{
    let status: Int?
    let msg: String?
    let token: String?
    let puesto: String?
    let nombre: String?
    let email: String?
    let salario: Double?
    let bio: String?
}
