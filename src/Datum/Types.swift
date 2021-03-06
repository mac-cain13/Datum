//
//  Types.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation

public typealias OffsetInSeconds = Int

public struct AbsoluteDateTime {
  internal let nsdate: NSDate // Invariant: Should be UTC
}

public struct RelativeDateTime {
  internal let nsdate: NSDate // Invariant: Should be UTC
}

public struct RelativeDate {
  internal let nsdate: NSDate // Invariant: Should be midnight UTC
}

public struct RelativeTime {
  internal let components: NSDateComponents
}

public struct ZonedDateTime {
  internal let absoluteDateTime: AbsoluteDateTime // Invariant: Should be UTC
  public let timeZone: NSTimeZone
}

public struct ZonedDate {
  internal let absoluteDateTime: AbsoluteDateTime // Invariant: Should be midnight UTC
  public let timeZone: NSTimeZone
}

public struct OffsetDateTime {
  internal let absoluteDateTime: AbsoluteDateTime // Invariant: Should be UTC
  public let utcOffset: OffsetInSeconds
}

public struct OffsetDate {
  internal let absoluteDateTime: AbsoluteDateTime // Invariant: Should be midnight UTC
  public let utcOffset: OffsetInSeconds
}

public enum HammerTime {
  /* Can't touch this */
}
