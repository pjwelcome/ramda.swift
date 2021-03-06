//
// Created by Justin Guedes on 2016/09/17.
//

import Foundation

extension R {

    /**

        Sees if 'value' is the of the supplied 'type'.

        - parameter type: The type to check against.
        - parameter value: The value to check against the type.

        - returns: True is value is of the type, false otherwise.

    */

    public class func `is`<A, B>(_ type: A.Type, value: B) -> Bool {
        return value is A
    }

    /**

        Sees if 'value' is the of the supplied 'type'.

        - parameter type: The type to check against.

        - returns: A curried function that accepts the value and returns
        true is value is of the type, false otherwise.

    */

    public class func `is`<A, B>(_ type: A.Type) -> (_ value: B) -> Bool {
        return curry(`is`)(type)
    }

}
