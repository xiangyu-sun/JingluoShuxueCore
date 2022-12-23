//
//  File.swift
//
//
//  Created by Xiangyu Sun on 1/11/22.
//

import ChineseAstrologyCalendar

public enum 五腑: String, CaseIterable {
  case 膀胱
  case 小腸
  case 胃
  case 大腸
  case 膽

  // MARK: Public

  public var wuxing: Wuxing {
    switch self {
    case .膀胱:
      return .shui
    case .小腸:
      return .huo
    case .胃:
      return .tu
    case .大腸:
      return .jin
    case .膽:
      return .mu
    }
  }

  public var 情緒: String {
    switch self {
    case .大腸:
      return "悲傷"
    case .胃:
      return "思慮"
    case .小腸:
      return "喜樂"
    case .膽:
      return "憤怒"
    case .膀胱:
      return "恐懼"
    }
  }
}
