//
// Created by Justin Guedes on 2016/09/11.
//

import Foundation

extension R {

    public enum ClampError: Error {
        case MinGreaterThanMax
    }

    /**

        Clamps the value between the min and max.

        - parameter min: The minimum value.
        - parameter max: The maximum value.
        - parameter value: The value to clamp.

        - throws: 'ClampError.MinGreaterThanMax' if 'min' is greater than 'max'.

        - returns: The clamped value.

    */

    public class func clamp<T: Comparable>(_ min: T, and max: T, with value: T) throws -> T {
        if min > max {
            throw ClampError.MinGreaterThanMax
        }

        return  value < min ? min :
                value > max ? max :
                value
    }

    /**

        Clamps the value between the min and max.

        - parameter min: The minimum value.

        - throws: 'ClampError.MinGreaterThanMax' if 'min' is greater than 'max'.

        - returns: A curried function that accepts the min and value parameters and
        returns the clamped value.

    */

    public class func clamp<T: Comparable>(_ min: T) -> (_ and: T) -> (_ with: T) throws -> T {
        return curry(clamp)(min)
    }

}
