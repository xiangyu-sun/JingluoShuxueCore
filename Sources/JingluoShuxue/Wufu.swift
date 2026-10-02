//
//  Wufu.swift
//
//  Created by Xiangyu Sun on 1/11/22.
//

import ChineseAstrologyCalendar

/// 六腑 — the six hollow organs (五腑 + 三焦).
/// 三焦 has no direct wuxing or paired zang in the traditional five-element sense,
/// but is paired with 心包 via the meridian system.
public enum 六腑: String, CaseIterable, Hashable, Codable, Sendable {
  case 膀胱
  case 小腸
  case 胃
  case 大腸
  case 膽
  case 三焦

  // MARK: Public

  public var wuxing: Wuxing? {
    switch self {
    case .膀胱: return .water
    case .小腸: return .fire
    case .胃:   return .earth
    case .大腸: return .metal
    case .膽:   return .wood
    case .三焦: return nil   // 三焦 spans all three jiao; no single wuxing
    }
  }

  public var 情緒: String {
    switch self {
    case .大腸: return "悲傷"
    case .胃:   return "思慮"
    case .小腸: return "喜樂"
    case .膽:   return "憤怒"
    case .膀胱: return "恐懼"
    case .三焦: return "驚"
    }
  }

  /// 相表里的臟 (paired solid organ). 三焦 pairs with 心包 via the meridian system.
  public var 相表里臟: 五臟? {
    switch self {
    case .大腸: return .肺
    case .胃:   return .脾
    case .小腸: return .心
    case .膽:   return .肝
    case .膀胱: return .腎
    case .三焦: return nil  // paired with 心包, which is not one of the 五臟
    }
  }

  /// 所属经脉 (governing meridian)
  public var 经脉: 十二经脉 {
    switch self {
    case .大腸: return .手阳明大腸经
    case .胃:   return .足阳明胃经
    case .小腸: return .手太阳小腸经
    case .膽:   return .足少阳胆经
    case .膀胱: return .足太阳膀胱经
    case .三焦: return .手少阳三焦经
    }
  }

  /// 主要功能 (primary TCM functions)
  public var 主要功能: [String] {
    switch self {
    case .膀胱: return ["儲存排泄尿液", "氣化水液"]
    case .小腸: return ["受盛化物", "泌別清濁"]
    case .胃:   return ["受納腐熟水穀", "主降濁"]
    case .大腸: return ["傳化糟粕", "主津液"]
    case .膽:   return ["儲存排泄膽汁", "主決斷"]
    case .三焦: return ["通行元氣", "運行水液", "總司氣機與水液代謝"]
    }
  }
}

/// Backwards-compatible typealias. Prefer 六腑 in new code.
public typealias 五腑 = 六腑
