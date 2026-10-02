import ChineseAstrologyCalendar
import Foundation
import Testing
@testable import JingluoShuxue

@Suite struct 十二经脉Tests {

  @Test func interiorExteriorPairingIsSymmetric() {
    for meridian in 十二经脉.allCases {
      #expect(meridian.相表里经.相表里经 == meridian)
      #expect(meridian.是表经 != meridian.相表里经.是表经)
    }
  }

  @Test func ziwuLiuzhuCoversEveryMeridianOnce() {
    let flow = Dizhi.allCases.map { $0.luizhu }
    #expect(Set(flow).count == 12)
    #expect(Dizhi.yin.luizhu == .手太陰肺经)
    #expect(气血循环流注.count == 12)
  }

  @Test func organPairingsAgree() {
    for zang in 五臟.allCases {
      #expect(zang.相表里.相表里臟 == zang)
      #expect(zang.经脉.organReference == zang.rawValue)
    }
  }

  @Test func acupointCountTotals309() {
    // WHO standard: 309 points on the twelve regular meridians.
    #expect(十二经脉.allCases.map { $0.腧穴数 }.reduce(0, +) == 309)
  }

  @Test func localizedNames() {
    #expect(十二经脉.手阳明大腸经.localizedName(in: .zhHant) == "手陽明大腸經")
    #expect(十二经脉.手阳明大腸经.localizedName(in: .zhHans) == "手阳明大肠经")
    #expect(十二经脉.手阳明大腸经.localizedName(in: .en) == "Large Intestine Meridian")
    #expect(五臟.腎.localizedName(in: .zhHans) == "肾")
    #expect(五臟.腎.localizedName(in: .en) == "Kidney")
    #expect(六腑.膽.localizedName(in: .zhHans) == "胆")
    #expect(六腑.三焦.localizedName(in: .en) == "Triple Burner")
    // Languages without their own text fall back to English.
    #expect(十二经脉.足少陰腎经.localizedName(in: .ru) == "Kidney Meridian")
    #expect(奇经八脉.带脉.localizedName(in: .es) == "Belt Vessel")
  }

  @Test func fangweiMatchesFiveDirections() {
    #expect(五臟.肝.fangwei == .east)
    #expect(五臟.脾.fangwei == .center)
    for zang in 五臟.allCases {
      #expect(zang.fangwei.wuxing == zang.wuxing)
    }
  }
}

@Suite struct 奇经八脉Tests {

  @Test func allEightVessels() {
    #expect(奇经八脉.allCases.count == 8)
    #expect(奇经八脉.带脉.localizedName(in: .zhHant) == "帶脈")
    #expect(奇经八脉.阳蹺脉.localizedName(in: .zhHans) == "阳跷脉")
    #expect(奇经八脉.陰蹺脉.localizedName(in: .en) == "Yin Heel Vessel")
  }

  @Test func decodesLegacyRawValues() throws {
    let data = Data(#"["代脉", "陰脉", "阳脉", "督脉"]"#.utf8)
    let decoded = try JSONDecoder().decode([奇经八脉].self, from: data)
    #expect(decoded == [.带脉, .陰蹺脉, .阳蹺脉, .督脉])
  }

  @Test func roundTripsCurrentRawValues() throws {
    let data = try JSONEncoder().encode(奇经八脉.allCases)
    #expect(try JSONDecoder().decode([奇经八脉].self, from: data) == 奇经八脉.allCases)
  }
}
