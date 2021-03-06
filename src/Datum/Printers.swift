//
//  Printers.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-06.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation


extension AbsoluteDateTime: CustomStringConvertible {
  public var description: String {
    return nsdate.description
  }
}

extension RelativeDateTime: CustomStringConvertible {
  public var description: String {
    return DateFormatters.relativeDateTime.stringFromDate(nsdate)
  }
}

extension RelativeDate: CustomStringConvertible {
  public var description: String {
    return DateFormatters.relativeDate.stringFromDate(nsdate)
  }
}

extension RelativeTime: CustomStringConvertible {
  public var description: String {
    if components.calendar == nil {
      fatalError("RelativeTime: components.calendar should be set")
    }
    guard let date = components.date else {
      fatalError("RelativeTime: Can't compute date")
    }

    return DateFormatters.relativeTime.stringFromDate(date)
  }
}

extension ZonedDateTime: CustomStringConvertible {
  public var description: String {
    let dateFormatter = DateFormatters.offsetDateTime.copy() as! NSDateFormatter
    dateFormatter.timeZone = timeZone

    return dateFormatter.stringFromDate(absoluteDateTime.nsdate) + " \(timeZone.name)"
  }
}

extension ZonedDate: CustomStringConvertible {
  public var description: String {
    let dateFormatter = DateFormatters.offsetDate.copy() as! NSDateFormatter
    dateFormatter.timeZone = timeZone

    return dateFormatter.stringFromDate(absoluteDateTime.nsdate) + " \(timeZone.name)"
  }
}

extension OffsetDateTime: CustomStringConvertible {
  public var description: String {
    let dateFormatter = DateFormatters.offsetDateTime.copy() as! NSDateFormatter
    dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: Int(utcOffset))

    return dateFormatter.stringFromDate(absoluteDateTime.nsdate)
  }
}

extension OffsetDate: CustomStringConvertible {
  public var description: String {
    let dateFormatter = DateFormatters.offsetDate.copy() as! NSDateFormatter
    dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: Int(utcOffset))

    return dateFormatter.stringFromDate(absoluteDateTime.nsdate)
  }
}
