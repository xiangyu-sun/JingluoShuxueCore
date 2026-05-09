//
//  Wuzang.swift
//
//  Created by Xiangyu Sun on 1/11/22.
//

import ChineseAstrologyCalendar

public enum 五臟: String, CaseIterable, Hashable, Codable {
  case 肺
  case 脾
  case 心
  case 肝
  case 腎

  // MARK: Public

  public var wuxing: Wuxing {
    switch self {
    case .肺: return .metal
    case .脾: return .earth
    case .心: return .fire
    case .肝: return .wood
    case .腎: return .water
    }
  }

  public var 情緒: String {
    switch self {
    case .肺: return "悲傷"
    case .脾: return "思慮"
    case .心: return "喜樂"
    case .肝: return "憤怒"
    case .腎: return "恐懼"
    }
  }

  /// 相表里的腑 (paired hollow organ)
  public var 相表里: 六腑 {
    switch self {
    case .肺: return .大腸
    case .脾: return .胃
    case .心: return .小腸
    case .肝: return .膽
    case .腎: return .膀胱
    }
  }

  /// 所属经脉 (governing meridian)
  public var 经脉: 十二经脉 {
    switch self {
    case .肺: return .手太陰肺经
    case .脾: return .足太陰脾经
    case .心: return .手少陰心经
    case .肝: return .足厥陰肝经
    case .腎: return .足少陰腎经
    }
  }

  /// 開竅 (sensory orifice)
  public var 开窍: 人体部位 {
    switch self {
    case .肺: return .鼻
    case .脾: return .口
    case .心: return .舌
    case .肝: return .目
    case .腎: return .耳
    }
  }

  /// 在體 (associated body tissue)
  public var 在体: String {
    switch self {
    case .肺: return "皮毛"
    case .脾: return "肌肉"
    case .心: return "脈"
    case .肝: return "筋"
    case .腎: return "骨"
    }
  }

  /// 其華 (external manifestation / bloom)
  public var 其華: String {
    switch self {
    case .肺: return "毛"
    case .脾: return "唇"
    case .心: return "面"
    case .肝: return "爪"
    case .腎: return "髮"
    }
  }

  /// 五色 (associated colour used in diagnosis)
  public var 五色: String {
    switch self {
    case .肺: return "白"
    case .脾: return "黃"
    case .心: return "赤"
    case .肝: return "青"
    case .腎: return "黑"
    }
  }

  /// 五味 (associated taste — both craving and therapeutic)
  public var 五味: String {
    switch self {
    case .肺: return "辛"
    case .脾: return "甘"
    case .心: return "苦"
    case .肝: return "酸"
    case .腎: return "鹹"
    }
  }

  /// 五液 (associated body fluid secreted by each organ)
  public var 五液: String {
    switch self {
    case .肺: return "涕"
    case .脾: return "涎"
    case .心: return "汗"
    case .肝: return "淚"
    case .腎: return "唾"
    }
  }

  /// 五聲 (associated vocal sound used in diagnosis)
  public var 五聲: String {
    switch self {
    case .肺: return "哭"
    case .脾: return "歌"
    case .心: return "笑"
    case .肝: return "呼"
    case .腎: return "呻"
    }
  }

  /// 五時 (associated season)
  public var 五時: String {
    switch self {
    case .肺: return "秋"
    case .脾: return "長夏"
    case .心: return "夏"
    case .肝: return "春"
    case .腎: return "冬"
    }
  }

  /// 五方 (associated cardinal direction)
  public var 五方: String {
    switch self {
    case .肺: return "西"
    case .脾: return "中"
    case .心: return "南"
    case .肝: return "東"
    case .腎: return "北"
    }
  }
}
