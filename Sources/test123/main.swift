import Foundation
#if os(Linux)
@preconcurrency import FoundationNetworking
#if canImport(Glibc)
import Glibc
#elseif canImport(Musl)
import Musl
#endif
#endif

@main
struct Main {
    static func main() async {
        let url = URL(string:"https://swift.org/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        print("request: \(request)")
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            print(data)
            print(response)
        } catch {
            print(error)
        }

    }
}
