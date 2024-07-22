import Foundation
@preconcurrency import FoundationNetworking
#if canImport(Glibc)
import Glibc
#elseif canImport(Musl)
import Musl
#endif

@main
struct Main {
    static func main() async {
        let url = URL(string:"https://forums.swift.org/c/general-announce/24")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        print(request)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            print(data)
            print(response)
        } catch {
            print(error)
        }

    }
}