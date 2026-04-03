//
//  File.swift
//
//
//  Created by Xiangyu Sun on 1/11/22.
//

import ChineseAstrologyCalendar

public enum 五臟: String, CaseIterable {
  case 肺
  case 脾
  case 心
  case 肝
  case 腎

  // MARK: Public

  public var wuxing: Wuxing {
    switch self {
    case .肺:
      return .metal
    case .脾:
      return .earth
    case .心:
      return .fire
    case .肝:
      return .wood
    case .腎:
      return .water
    }
  }

  public var 情緒: String {
    switch self {
    case .肺:
      return "悲傷"
    case .脾:
      return "思慮"
    case .心:
      return "喜樂"
    case .肝:
      return "憤怒"
    case .腎:
      return "恐懼"
    }
  }

  /// 相表里的腑 (paired hollow organ)
  public var 相表里: 五腑 {
    switch self {
    case .肺:
      return .大腸
    case .脾:
      return .胃
    case .心:
      return .小腸
    case .肝:
      return .膽
    case .腎:
      return .膀胱
    }
  }

  /// 所属经脉 (governing meridian)
  public var 经脉: 十二经脉 {
    switch self {
    case .肺:
      return .手太陰肺经
    case .脾:
      return .足太陰脾经
    case .心:
      return .手少陰心经
    case .肝:
      return .足厥陰肝经
    case .腎:
      return .足少陰腎经
    }
  }

  /// 开窍 (sensory orifice)
  public var 开窍: 人体部位 {
    switch self {
    case .肺:
      return .鼻
    case .脾:
      return .口
    case .心:
      return .舌
    case .肝:
      return .目
    case .腎:
      return .耳
    }
  }

  /// 在体 (associated body tissue)
  public var 在体: String {
    switch self {
    case .肺:
      return "皮毛"
    case .脾:
      return "肌肉"
    case .心:
      return "脉"
    case .肝:
      return "筋"
    case .腎:
      return "骨"
    }
  }
}
