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
      return .water
    case .小腸:
      return .fire
    case .胃:
      return .earth
    case .大腸:
      return .metal
    case .膽:
      return .wood
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

  /// 相表里的臟 (paired solid organ)
  public var 相表里: 五臟 {
    switch self {
    case .大腸:
      return .肺
    case .胃:
      return .脾
    case .小腸:
      return .心
    case .膽:
      return .肝
    case .膀胱:
      return .腎
    }
  }

  /// 所属经脉 (governing meridian)
  public var 经脉: 十二经脉 {
    switch self {
    case .大腸:
      return .手阳明大腸经
    case .胃:
      return .足阳明胃经
    case .小腸:
      return .手太阳小腸经
    case .膽:
      return .足少阳胆经
    case .膀胱:
      return .足太阳膀胱经
    }
  }
}
