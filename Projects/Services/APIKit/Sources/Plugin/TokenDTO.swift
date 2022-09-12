struct TokenDTO: Equatable, Decodable {
    let accessToken: String
    let refreshToken: String
    let expiredAt: String
}
