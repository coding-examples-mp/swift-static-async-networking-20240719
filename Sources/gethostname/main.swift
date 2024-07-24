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
        let hostname = gethostbyname("swift.org")
        guard let hostname else {
            print("Can't resolve hostname")
            return
        }
        let hName = hostname.pointee.h_name
        guard let hName else {
            print("Can't get official name")
            return
        }
        let name = String(cString: hName)
        let hAddrList = hostname.pointee.h_addr_list

        print("found address for : \(name)!")
    }
}
