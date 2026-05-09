//
//  JingluoType.swift
//  AcupuncturePoints
//
//  Created by xiangyu sun on 10/20/17.
//  Copyright © 2017 xiangyu sun. All rights reserved.
//

import ChineseAstrologyCalendar
import Foundation

public let 气血循环流注: [十二经脉] = [.手太陰肺经, .手阳明大腸经, .足阳明胃经, .足太陰脾经, .手少陰心经, .手太阳小腸经, .足太阳膀胱经, .足少陰腎经, .手厥陰心包经, .手少阳三焦经, .足少阳胆经, .足厥陰肝经]

extension Dizhi {
  public var luizhu: 十二经脉 {
    switch self {
    case .zi:
      return .足少阳胆经
    case .chou:
      return .足厥陰肝经
    case .yin:
      return .手太陰肺经
    case .mao:
      return .手阳明大腸经
    case .chen:
      return .足阳明胃经
    case .si:
      return .足太陰脾经
    case .wu:
      return .手少陰心经
    case .wei:
      return .手太阳小腸经
    case .shen:
      return .足太阳膀胱经
    case .you:
      return .足少陰腎经
    case .xu:
      return .手厥陰心包经
    case .hai:
      return .手少阳三焦经
    }
  }

  /// Clock-hour range during which qi peaks in the associated meridian (24-hour format).
  public var 流注時辰: ClosedRange<Int> {
    switch self {
    case .zi:  return 23...24  // 子 23:00–01:00 (represented as 23–24 + wraps to 0–1)
    case .chou: return 1...3
    case .yin:  return 3...5
    case .mao:  return 5...7
    case .chen: return 7...9
    case .si:   return 9...11
    case .wu:   return 11...13
    case .wei:  return 13...15
    case .shen: return 15...17
    case .you:  return 17...19
    case .xu:   return 19...21
    case .hai:  return 21...23
    }
  }
}

public let 十四经脉: [经络组成] = [
  十二经脉.手太陰肺经,
  十二经脉.手阳明大腸经,
  十二经脉.足阳明胃经,
  十二经脉.足太陰脾经,
  十二经脉.手少陰心经,
  十二经脉.手太阳小腸经,
  十二经脉.足太阳膀胱经,
  十二经脉.足少陰腎经,
  十二经脉.手厥陰心包经,
  十二经脉.手少阳三焦经,
  十二经脉.足少阳胆经,
  十二经脉.足厥陰肝经,
  奇经八脉.督脉,
  奇经八脉.任脉,
]

// MARK: - 经络组成

public protocol 经络组成 { }

// MARK: - 五輸穴詳情

/// Details of the five shu-transporting points (五輸穴) for a meridian.
/// 井 (jǐng) well — distal tip; 滎 (yíng) spring; 輸 (shū) stream;
/// 經 (jīng) river; 合 (hé) sea — near the elbow/knee.
public struct 五输穴详情: Equatable, Hashable, Codable {
  public let 井: String
  public let 荥: String
  public let 输: String
  public let 经: String
  public let 合: String

  public init(井: String, 荥: String, 输: String, 经: String, 合: String) {
    self.井 = 井
    self.荥 = 荥
    self.输 = 输
    self.经 = 经
    self.合 = 合
  }
}

// MARK: - 八會穴

/// The eight influential/meeting points (八會穴), each dominating a particular tissue or substance.
public enum 八會穴: String, CaseIterable, Hashable, Codable {
  case 臟會 = "章門 (LR13)"   // influential point of zang organs
  case 腑會 = "中脘 (CV12)"   // influential point of fu organs
  case 氣會 = "膻中 (CV17)"   // influential point of qi
  case 血會 = "膈俞 (BL17)"   // influential point of blood
  case 筋會 = "陽陵泉 (GB34)" // influential point of sinews
  case 脈會 = "太淵 (LU9)"    // influential point of vessels/pulse
  case 骨會 = "大杼 (BL11)"   // influential point of bone
  case 髓會 = "懸鐘 (GB39)"   // influential point of marrow

  public var description: String {
    switch self {
    case .臟會: return "臟之會穴，治五臟疾患"
    case .腑會: return "腑之會穴，治六腑疾患"
    case .氣會: return "氣之會穴，治氣機失調"
    case .血會: return "血之會穴，治血證"
    case .筋會: return "筋之會穴，治筋骨痿痹"
    case .脈會: return "脈之會穴，治脈管疾患"
    case .骨會: return "骨之會穴，治骨病"
    case .髓會: return "髓之會穴，治髓海不足"
    }
  }
}

// MARK: - 十二经脉

//    case 十二经别
//    case 十二经筋
//
//    case 十二皮部
//
//    case 十五络脉
//    case 浮络
//    case 孙络

public enum 十二经脉: String, CaseIterable, Hashable, Codable, 经络组成 {
  case 手太陰肺经
  case 手少陰心经
  case 手厥陰心包经
  case 手阳明大腸经
  case 手太阳小腸经
  case 手少阳三焦经
  case 足太陰脾经
  case 足少陰腎经
  case 足厥陰肝经
  case 足阳明胃经
  case 足太阳膀胱经
  case 足少阳胆经

  // MARK: Public

  /// English name of the meridian.
  public var englishName: String {
    switch self {
    case .手太陰肺经:   return "Lung Meridian"
    case .手少陰心经:   return "Heart Meridian"
    case .手厥陰心包经: return "Pericardium Meridian"
    case .手阳明大腸经: return "Large Intestine Meridian"
    case .手太阳小腸经: return "Small Intestine Meridian"
    case .手少阳三焦经: return "Triple Burner Meridian"
    case .足太陰脾经:   return "Spleen Meridian"
    case .足少陰腎经:   return "Kidney Meridian"
    case .足厥陰肝经:   return "Liver Meridian"
    case .足阳明胃经:   return "Stomach Meridian"
    case .足太阳膀胱经: return "Bladder Meridian"
    case .足少阳胆经:   return "Gallbladder Meridian"
    }
  }

  /// Standard international abbreviation (WHO).
  public var abbreviation: String {
    switch self {
    case .手太陰肺经:   return "LU"
    case .手少陰心经:   return "HT"
    case .手厥陰心包经: return "PC"
    case .手阳明大腸经: return "LI"
    case .手太阳小腸经: return "SI"
    case .手少阳三焦经: return "TE"
    case .足太陰脾经:   return "SP"
    case .足少陰腎经:   return "KI"
    case .足厥陰肝经:   return "LR"
    case .足阳明胃经:   return "ST"
    case .足太阳膀胱经: return "BL"
    case .足少阳胆经:   return "GB"
    }
  }

  public var 五行: Wuxing? {
    switch self {
    case .手太陰肺经:   return .metal
    case .手少陰心经:   return .fire
    case .手厥陰心包经: return nil
    case .手阳明大腸经: return .metal
    case .手太阳小腸经: return .fire
    case .手少阳三焦经: return nil
    case .足太陰脾经:   return .earth
    case .足少陰腎经:   return .water
    case .足厥陰肝经:   return .wood
    case .足阳明胃经:   return .earth
    case .足太阳膀胱经: return .water
    case .足少阳胆经:   return .wood
    }
  }

  public func 是阳吗() -> Bool {
    rawValue.contains("阳")
  }

  /// 循行部位 (meridian pathway regions)
  public var 循行部位: [人体部位] {
    switch self {
    case .手太陰肺经:
      return [.胸部, .上肢]
    case .手少陰心经:
      return [.胸部, .腋下, .上肢]
    case .手厥陰心包经:
      return [.胸部, .腋下, .上肢]
    case .手阳明大腸经:
      return [.上肢, .肩部, .颈部, .面额部]
    case .手太阳小腸经:
      return [.上肢, .肩胛部, .颈部, .颊部]
    case .手少阳三焦经:
      return [.上肢, .肩部, .颈部, .耳颞部]
    case .足太陰脾经:
      return [.下肢, .腹胸, .胸部]
    case .足少陰腎经:
      return [.下肢, .前腹部, .胸部]
    case .足厥陰肝经:
      return [.下肢, .前腹部, .肋部, .头顶]
    case .足阳明胃经:
      return [.头面, .颈部, .胸部, .腹胸, .下肢]
    case .足太阳膀胱经:
      return [.头后部, .枕项部, .背部, .下肢]
    case .足少阳胆经:
      return [.头面, .耳颞部, .侧部, .肋部, .下肢]
    }
  }

  /// 腧穴數 — number of acupoints on each meridian
  public var 腧穴数: Int {
    switch self {
    case .手太陰肺经:   return 11
    case .手少陰心经:   return 9
    case .手厥陰心包经: return 9
    case .手阳明大腸经: return 20
    case .手太阳小腸经: return 19
    case .手少阳三焦经: return 23
    case .足太陰脾经:   return 21
    case .足少陰腎经:   return 27
    case .足厥陰肝经:   return 14
    case .足阳明胃经:   return 45
    case .足太阳膀胱经: return 67
    case .足少阳胆经:   return 44
    }
  }

  /// 是表經 — true if this is a yang (exterior/表) meridian; false if yin (interior/裏).
  public var 是表经: Bool { 是阳吗() }

  /// 是裏經 — true if this is a yin (interior/裏) meridian; false if yang (exterior/表).
  public var 是里经: Bool { !是阳吗() }

  /// 相表裏經 — the paired interior-exterior meridian.
  /// Yang meridians return their yin partner and vice versa.
  public var 相表里经: 十二经脉 {
    switch self {
    case .手太陰肺经:   return .手阳明大腸经
    case .手阳明大腸经: return .手太陰肺经
    case .足阳明胃经:   return .足太陰脾经
    case .足太陰脾经:   return .足阳明胃经
    case .手少陰心经:   return .手太阳小腸经
    case .手太阳小腸经: return .手少陰心经
    case .足太阳膀胱经: return .足少陰腎经
    case .足少陰腎经:   return .足太阳膀胱经
    case .手厥陰心包经: return .手少阳三焦经
    case .手少阳三焦经: return .手厥陰心包经
    case .足少阳胆经:   return .足厥陰肝经
    case .足厥陰肝经:   return .足少阳胆经
    }
  }

  /// 表里经 — the paired interior-exterior meridian.
  /// - Note: Deprecated. Use `相表裏經` instead for clarity.
  @available(*, deprecated, renamed: "相表里经")
  public var 表里经: 十二经脉 { 相表里经 }

  /// 募穴 — front-mu alarm point (on the chest/abdomen)
  public var 募穴: String {
    switch self {
    case .手太陰肺经:   return "中府 (LU1)"
    case .手少陰心经:   return "巨闕 (CV14)"
    case .手厥陰心包经: return "膻中 (CV17)"
    case .手阳明大腸经: return "天樞 (ST25)"
    case .手太阳小腸经: return "關元 (CV4)"
    case .手少阳三焦经: return "石門 (CV5)"
    case .足太陰脾经:   return "章門 (LR13)"
    case .足少陰腎经:   return "京門 (GB25)"
    case .足厥陰肝经:   return "期門 (LR14)"
    case .足阳明胃经:   return "中脘 (CV12)"
    case .足太阳膀胱经: return "中極 (CV3)"
    case .足少阳胆经:   return "日月 (GB24)"
    }
  }

  /// 背俞穴 — back-shu transport point (on the bladder meridian of the back)
  public var 背俞穴: String {
    switch self {
    case .手太陰肺经:   return "肺俞 (BL13)"
    case .手少陰心经:   return "心俞 (BL15)"
    case .手厥陰心包经: return "厥陰俞 (BL14)"
    case .手阳明大腸经: return "大腸俞 (BL25)"
    case .手太阳小腸经: return "小腸俞 (BL27)"
    case .手少阳三焦经: return "三焦俞 (BL22)"
    case .足太陰脾经:   return "脾俞 (BL20)"
    case .足少陰腎经:   return "腎俞 (BL23)"
    case .足厥陰肝经:   return "肝俞 (BL18)"
    case .足阳明胃经:   return "胃俞 (BL21)"
    case .足太阳膀胱经: return "膀胱俞 (BL28)"
    case .足少阳胆经:   return "膽俞 (BL19)"
    }
  }

  /// 主要功能 — primary TCM functions of the meridian
  public var 主要功能: [String] {
    switch self {
    case .手太陰肺经:
      return ["主氣司呼吸", "宣發肅降", "通調水道", "朝百脈主治節"]
    case .手少陰心经:
      return ["主血脈", "主神志", "開竅於舌"]
    case .手厥陰心包经:
      return ["代心行令", "保護心臟", "主神志"]
    case .手阳明大腸经:
      return ["傳化糟粕", "主津液"]
    case .手太阳小腸经:
      return ["受盛化物", "泌別清濁", "主液"]
    case .手少阳三焦经:
      return ["通行諸氣", "運行水液", "總領五臟六腑"]
    case .足太陰脾经:
      return ["主運化", "主升清", "主統血", "主肌肉四肢"]
    case .足少陰腎经:
      return ["藏精主生長發育生殖", "主水", "主納氣", "主骨生髓"]
    case .足厥陰肝经:
      return ["主疏泄", "主藏血", "主筋", "開竅於目"]
    case .足阳明胃经:
      return ["受納腐熟水穀", "主降濁", "為後天之本"]
    case .足太阳膀胱经:
      return ["儲存排泄尿液", "主津液氣化"]
    case .足少阳胆经:
      return ["儲存排泄膽汁", "主決斷"]
    }
  }

  /// 主治病症 — principal symptoms and conditions treated
  public var 主治病症: [String] {
    switch self {
    case .手太陰肺经:
      return ["咳嗽", "氣喘", "胸悶", "咽喉腫痛", "自汗", "傷風感冒", "皮膚病"]
    case .手少陰心经:
      return ["心悸", "心痛", "失眠", "健忘", "癲狂", "胸悶", "咽乾"]
    case .手厥陰心包经:
      return ["心悸", "心煩", "胸痛", "癲狂", "嘔吐", "手心熱"]
    case .手阳明大腸经:
      return ["腹痛", "腹瀉", "便秘", "牙痛", "咽喉腫痛", "面癱", "熱病"]
    case .手太阳小腸经:
      return ["耳鳴", "耳聾", "目黃", "頸項強痛", "肩臂痛", "熱病"]
    case .手少阳三焦经:
      return ["耳聾", "耳鳴", "咽喉腫痛", "偏頭痛", "目赤", "熱病"]
    case .足太陰脾经:
      return ["腹脹", "腹瀉", "消化不良", "浮腫", "倦怠", "月經不調", "崩漏"]
    case .足少陰腎经:
      return ["腰痛", "耳鳴", "耳聾", "遺精", "陽痿", "遺尿", "水腫", "咽乾"]
    case .足厥陰肝经:
      return ["脅痛", "眩暈", "疝氣", "月經不調", "目疾", "遺尿", "小便不利"]
    case .足阳明胃经:
      return ["胃痛", "嘔吐", "腹脹", "消化不良", "牙痛", "面癱", "熱病", "下肢痿痹"]
    case .足太阳膀胱经:
      return ["頭痛", "頸項強痛", "腰背痛", "遺尿", "尿頻", "目疾", "熱病"]
    case .足少阳胆经:
      return ["偏頭痛", "眩暈", "目赤腫痛", "耳聾", "口苦", "脅肋痛", "下肢痿痹"]
    }
  }

  /// 絡穴 — the luo-connecting point of the meridian
  public var 络穴: String {
    switch self {
    case .手太陰肺经:   return "列缺 (LU7)"
    case .手少陰心经:   return "通裏 (HT5)"
    case .手厥陰心包经: return "內關 (PC6)"
    case .手阳明大腸经: return "偏歷 (LI6)"
    case .手太阳小腸经: return "支正 (SI7)"
    case .手少阳三焦经: return "外關 (TE5)"
    case .足太陰脾经:   return "公孫 (SP4)"
    case .足少陰腎经:   return "大鐘 (KI4)"
    case .足厥陰肝经:   return "蠡溝 (LR5)"
    case .足阳明胃经:   return "豐隆 (ST40)"
    case .足太阳膀胱经: return "飛揚 (BL58)"
    case .足少阳胆经:   return "光明 (GB37)"
    }
  }

  /// 原穴 — the yuan-source point of the meridian
  public var 原穴: String {
    switch self {
    case .手太陰肺经:   return "太淵 (LU9)"
    case .手少陰心经:   return "神門 (HT7)"
    case .手厥陰心包经: return "大陵 (PC7)"
    case .手阳明大腸经: return "合谷 (LI4)"
    case .手太阳小腸经: return "腕骨 (SI4)"
    case .手少阳三焦经: return "陽池 (TE4)"
    case .足太陰脾经:   return "太白 (SP3)"
    case .足少陰腎经:   return "太溪 (KI3)"
    case .足厥陰肝经:   return "太衝 (LR3)"
    case .足阳明胃经:   return "衝陽 (ST42)"
    case .足太阳膀胱经: return "京骨 (BL64)"
    case .足少阳胆经:   return "丘墟 (GB40)"
    }
  }

  /// 郄穴 — the xi-cleft point (used for acute conditions)
  public var 郄穴: String {
    switch self {
    case .手太陰肺经:   return "孔最 (LU6)"
    case .手少陰心经:   return "陰郄 (HT6)"
    case .手厥陰心包经: return "郄門 (PC4)"
    case .手阳明大腸经: return "溫溜 (LI7)"
    case .手太阳小腸经: return "養老 (SI6)"
    case .手少阳三焦经: return "會宗 (TE7)"
    case .足太陰脾经:   return "地機 (SP8)"
    case .足少陰腎经:   return "水泉 (KI5)"
    case .足厥陰肝经:   return "中都 (LR6)"
    case .足阳明胃经:   return "梁丘 (ST34)"
    case .足太阳膀胱经: return "金門 (BL63)"
    case .足少阳胆经:   return "外丘 (GB36)"
    }
  }

  /// 五輸穴 — the five shu-transporting points (井滎輸經合)
  public var 五输穴: 五输穴详情 {
    switch self {
    case .手太陰肺经:
      return 五输穴详情(井: "少商 (LU11)", 荥: "魚際 (LU10)", 输: "太淵 (LU9)", 经: "經渠 (LU8)", 合: "尺澤 (LU5)")
    case .手少陰心经:
      return 五输穴详情(井: "少衝 (HT9)", 荥: "少府 (HT8)", 输: "神門 (HT7)", 经: "靈道 (HT4)", 合: "少海 (HT3)")
    case .手厥陰心包经:
      return 五输穴详情(井: "中衝 (PC9)", 荥: "勞宮 (PC8)", 输: "大陵 (PC7)", 经: "間使 (PC5)", 合: "曲澤 (PC3)")
    case .手阳明大腸经:
      return 五输穴详情(井: "商陽 (LI1)", 荥: "二間 (LI2)", 输: "三間 (LI3)", 经: "陽溪 (LI5)", 合: "曲池 (LI11)")
    case .手太阳小腸经:
      return 五输穴详情(井: "少澤 (SI1)", 荥: "前谷 (SI2)", 输: "後溪 (SI3)", 经: "陽谷 (SI5)", 合: "小海 (SI8)")
    case .手少阳三焦经:
      return 五输穴详情(井: "關衝 (TE1)", 荥: "液門 (TE2)", 输: "中渚 (TE3)", 经: "支溝 (TE6)", 合: "天井 (TE10)")
    case .足太陰脾经:
      return 五输穴详情(井: "隱白 (SP1)", 荥: "大都 (SP2)", 输: "太白 (SP3)", 经: "商丘 (SP5)", 合: "陰陵泉 (SP9)")
    case .足少陰腎经:
      return 五输穴详情(井: "湧泉 (KI1)", 荥: "然谷 (KI2)", 输: "太溪 (KI3)", 经: "復溜 (KI7)", 合: "陰谷 (KI10)")
    case .足厥陰肝经:
      return 五输穴详情(井: "大敦 (LR1)", 荥: "行間 (LR2)", 输: "太衝 (LR3)", 经: "中封 (LR4)", 合: "曲泉 (LR8)")
    case .足阳明胃经:
      return 五输穴详情(井: "厲兌 (ST45)", 荥: "內庭 (ST44)", 输: "陷谷 (ST43)", 经: "解溪 (ST41)", 合: "足三里 (ST36)")
    case .足太阳膀胱经:
      return 五输穴详情(井: "至陰 (BL67)", 荥: "足通谷 (BL66)", 输: "束骨 (BL65)", 经: "崑崙 (BL60)", 合: "委中 (BL40)")
    case .足少阳胆经:
      return 五输穴详情(井: "足竅陰 (GB44)", 荥: "俠溪 (GB43)", 输: "足臨泣 (GB41)", 经: "陽輔 (GB38)", 合: "陽陵泉 (GB34)")
    }
  }

  /// 五輸穴五行 — wuxing attributed to each of the five shu points.
  /// Yin meridians follow 木火土金水; Yang meridians follow 金水木火土.
  public var 五输穴五行: (井: Wuxing, 荥: Wuxing, 输: Wuxing, 经: Wuxing, 合: Wuxing) {
    if 是阳吗() {
      return (井: .metal, 荥: .water, 输: .wood, 经: .fire, 合: .earth)
    } else {
      return (井: .wood, 荥: .fire, 输: .earth, 经: .metal, 合: .water)
    }
  }

  /// 補穴 — tonification point (母穴, derived from five-element mother-child law)
  public var 補穴: String {
    switch self {
    case .手太陰肺经:   return "太淵 (LU9)"   // earth → metal
    case .手少陰心经:   return "少衝 (HT9)"   // wood → fire
    case .手厥陰心包经: return "中衝 (PC9)"   // wood → fire
    case .手阳明大腸经: return "曲池 (LI11)"  // earth → metal
    case .手太阳小腸经: return "後溪 (SI3)"   // wood → fire
    case .手少阳三焦经: return "中渚 (TE3)"   // wood → fire
    case .足太陰脾经:   return "大都 (SP2)"   // fire → earth
    case .足少陰腎经:   return "復溜 (KI7)"   // metal → water
    case .足厥陰肝经:   return "曲泉 (LR8)"   // water → wood
    case .足阳明胃经:   return "解溪 (ST41)"  // fire → earth
    case .足太阳膀胱经: return "至陰 (BL67)"  // metal → water
    case .足少阳胆经:   return "俠溪 (GB43)"  // water → wood
    }
  }

  /// 瀉穴 — sedation point (子穴, derived from five-element mother-child law)
  public var 瀉穴: String {
    switch self {
    case .手太陰肺经:   return "尺澤 (LU5)"   // metal → water
    case .手少陰心经:   return "神門 (HT7)"   // fire → earth
    case .手厥陰心包经: return "大陵 (PC7)"   // fire → earth
    case .手阳明大腸经: return "二間 (LI2)"   // metal → water
    case .手太阳小腸经: return "小海 (SI8)"   // fire → earth
    case .手少阳三焦经: return "天井 (TE10)"  // fire → earth
    case .足太陰脾经:   return "商丘 (SP5)"   // earth → metal
    case .足少陰腎经:   return "湧泉 (KI1)"   // water → wood
    case .足厥陰肝经:   return "行間 (LR2)"   // wood → fire
    case .足阳明胃经:   return "厲兌 (ST45)"  // earth → metal
    case .足太阳膀胱经: return "束骨 (BL65)"  // water → wood
    case .足少阳胆经:   return "陽輔 (GB38)"  // wood → fire
    }
  }
}

// MARK: - 十二经脉 Extensions

extension 十二经脉 {
  /// Short traditional organ name associated with this meridian.
  public var organReference: String {
    switch self {
    case .手太陰肺经:   return "肺"
    case .手少陰心经:   return "心"
    case .手厥陰心包经: return "心包"
    case .手阳明大腸经: return "大腸"
    case .手太阳小腸经: return "小腸"
    case .手少阳三焦经: return "三焦"
    case .足太陰脾经:   return "脾"
    case .足少陰腎经:   return "腎"
    case .足厥陰肝经:   return "肝"
    case .足阳明胃经:   return "胃"
    case .足太阳膀胱经: return "膀胱"
    case .足少阳胆经:   return "膽"
    }
  }
}

// MARK: - 奇经八脉

public enum 奇经八脉: String, Hashable, Codable, 经络组成 {
  case 督脉
  case 任脉
  case 冲脉
  case 代脉
  case 陰维脉
  case 阳维脉
  case 陰脉
  case 阳脉
}

// MARK: - 人体部位

public enum 人体部位: Hashable, Codable {
  case 头面
  case 面额部
  case 颊部
  case 头顶
  case 头后部
  case 枕项部
  case 耳颞部
  case 目系
  case 巅顶
  case 舌根
  case 舌本
  case 舌下
  case 胸部
  case 腋下
  case 肩部
  case 肩胛部
  case 肋部
  case 腹胸
  case 前胸
  case 前腹部
  case 背部
  case 侧部
  case 上肢
  case 下肢
  case 颌部
  case 颈部
  // 五官 (sensory orifices)
  case 鼻
  case 口
  case 舌
  case 目
  case 耳
}
