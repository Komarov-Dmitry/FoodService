
import Foundation
import UIKit

struct Food {
    var name: String
    var description: String
    var imageFood: UIImage?
    var costs = [Int]()
    var currentPrice: Int
    var totalPrice: Int { return currentPrice * count }
    var count: Int = 1
}
