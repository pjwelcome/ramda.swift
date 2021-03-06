//
// Created by Justin Guedes on 2016/09/16.
//

import Foundation

// swiftlint:disable line_length

extension R {

    /**

        Filters a sequence and returns an array of the filtered elements.

        - parameter function: The predicate function.
        - parameter sequence: The sequence to filter.

        - returns: A filtered array of elements that are accepted by the
        predicate.

    */

    public class func filter<A, B: Sequence>(_ function: (A) -> Bool, in sequence: B) -> [A] where A == B.Iterator.Element {
        return sequence.filter { function($0) }
    }

    /**

        Filters a sequence and returns an array of the filtered elements.

        - parameter function: The predicate function.

        - returns: A curried function that accepts a sequence and returns a
        filtered array of elements that are accepted by the predicate.

    */

    public class func filter<A, B: Sequence>(_ function: (A) -> Bool) -> (_ in: B) -> [A] where A == B.Iterator.Element {
        return curry(filter)(function)
    }
}

// swiftlint:enable line_length
