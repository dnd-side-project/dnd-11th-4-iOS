//
//  ServiceDetailViewController.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 10/17/24.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class ServiceDetailViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Propertise
    
    private let navigationBar = MDNavigationBar(type: .service)
    private let textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.text = """
            <맵땅>은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.
            ○ 이 개인정보처리방침은 2022년 11월 1일부터 적용됩니다.
            제1조(개인정보의 처리 목적)<맵땅>은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
            1. 홈페이지 회원가입 및 관리
            회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리 목적으로 개인정보를 처리합니다.
            2. 재화 또는 서비스 제공
            서비스 제공, 콘텐츠 제공, 맞춤서비스 제공을 목적으로 개인정보를 처리합니다.
            3. 마케팅 및 광고에의 활용
            신규 서비스(제품) 개발 및 맞춤 서비스 제공, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.
            제2조(개인정보의 처리 및 보유 기간)① <맵땅>은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
            - <홈페이지 회원가입 및 관리>
            <홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<지체없이 파기>까지 위 이용목적을 위하여 보유.이용됩니다.
            보유근거 : 회원회원 가입의사 확인, 회원제 서비스제공에 따른 본인식별/인증, 회원자격유지/관리
            관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년
            제3조(처리하는 개인정보의 항목)① <맵땅>은(는) 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조, 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
            「 개인정보 보호법 제17조 」
            1. 정보주체의 동의를 받은 경우
            2. 개인정보보호법 제15조제1항제2호,제3호,제5호에 따라 개인정보를 수집한 목적 범위에서 개인정보를 제공하는 경우
            「 개인정보 보호법 제18조 」
            1. 정보주체로부터 별도의 동의를 받는 경우
            2. 법률에 특별한 규정이 있는 경우
            3. 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우
            4. 〈삭제〉
            5. 개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우로서 보호위원회의 심의 · 의결을 거친 경우
            6. 조약, 그 밖의 국제협정의 이행을 위하여 외국정보 또는 국제기구에 제공하기 위하여 필요한 경우
            7. 범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우
            8. 법원의 재판업무 수행을 위하여 필요한 경우
            9. 형(形) 및 감호, 보호처분의 집행을 위하여 필요한 경우
            제4조(개인정보의 제3자 제공에 관한 사항)① <맵땅>은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
            ② <맵땅>은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
            1. <맵땅>
            개인정보를 제공받는 자 : 맵땅
            제공받는 자의 개인정보 이용목적 : 이메일, 로그인ID, 이름, 서비스 이용 기록, 접속 로그, 접속 IP 정보, 사용자 데이터
            제공받는 자의 보유.이용기간: 1년
            제5조(개인정보처리의 위탁에 관한 사항)① <맵땅>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
                위탁받는 자 (수탁자) :
                위탁하는 업무의 내용 :
                위탁기간 : 서비스 종료
            ② <맵땅>은(는) 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
            ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.
            제6조(개인정보의 파기절차 및 파기방법)
            ① <맵땅>은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.1. 법령 근거 :2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.1. 파기절차<맵땅> 은(는) 파기 사유가 발생한 개인정보를 선정하고, <맵땅> 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
            2. 파기방법
            전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다
            제7조(미이용자의 개인정보 파기 등에 관한 조치)
            ① <맵땅>은(는) 1년간 서비스를 이용하지 않은 이용자의 정보를 파기하고 있습니다. 다만, 다른 법령에서 정한 보존기간이 경과할 때까지 다른 이용자의 개인정보와 분리하여 별도로 저장·관리할 수 있습니다.② <맵땅>은(는) 개인정보의 파기 30일 전까지 개인정보가 파기되는 사실, 기간 만료일 및 파기되는 개인정보의 항목을 이메일, 문자 등 이용자에게 통지 가능한 방법으로 알리고 있습니다.③ 개인정보의 파기를 원하지 않으시는 경우, 기간 만료 전 서비스 로그인을 하시면 됩니다.
            제8조(정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항)
            ① 정보주체는 맵땅에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
            ② 제1항에 따른 권리 행사는 맵땅에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며  맵땅은(는) 이에 대해 지체 없이 조치하겠습니다.
            ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
            ④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
            ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
            ⑥  맵땅은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
            제9조(개인정보의 안전성 확보조치에 관한 사항)<맵땅>은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.
            1. 정기적인 자체 감사 실시개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.
            2. 개인정보 취급 직원의 최소화 및 교육개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.
            3. 개인정보의 암호화이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.
            4. 개인정보에 대한 접근 제한개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.
            제10조(개인정보를 자동으로 수집하는 장치의 설치·운영 및 그 거부에 관한 사항)
             맵땅 은(는) 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용하지 않습니다.
            제11조(추가적인 이용·제공 판단기준) <맵땅>은(는) 개인정보를 당초 수집목적을 벗어나 이용/제공하지 않습니다. 다만 ｢개인정보 보호법｣ 제15조제3항 및 제17조제4항에 따라 ｢개인정보 보호법 시행령｣ 제14조의2에 따른 사항을 고려하여 정보주체의 동의 없이 개인정보를 추가적으로 이용·제공할 수 있습니다. 해당경우에는 개인정보보호법 시행령 제14조의2에 명시된 각 사항을 고려하여 정보주체의 이익을 부당하게 침해하지 않도록 하고 있습니다.

            「 개인정보 보호법 시행령 제14조의2 」
            1. 당초 수집 목적과 관련성이 있는지 여부
            2. 개인정보를 수집한 정황 또는 처리 관행에 비추어 볼 때 개인정보의 추가적인 이용 또는 제공에 대한 예측 가능성이 있는지 여부
            3. 정보주체의 이익을 부당하게 침해하는지 여부
            4. 가명처리 또는 암호화 등 안전성 확보에 필요한 조치를 하였는지 여부
            ○ 이 개인정보처리방침은 2022년 11월 1일부터 적용됩니다.
            제1조(개인정보의 처리 목적)<맵땅>은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
            1. 홈페이지 회원가입 및 관리
            회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리 목적으로 개인정보를 처리합니다.
            2. 재화 또는 서비스 제공
            서비스 제공, 콘텐츠 제공, 맞춤서비스 제공을 목적으로 개인정보를 처리합니다.
            3. 마케팅 및 광고에의 활용
            신규 서비스(제품) 개발 및 맞춤 서비스 제공, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.
            제2조(개인정보의 처리 및 보유 기간)① <맵땅>은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
            - <홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<지체없이 파기>까지 위 이용목적을 위하여 보유.이용됩니다.
            - 보유근거 : 회원회원 가입의사 확인, 회원제 서비스제공에 따른 본인식별/인증, 회원자격유지/관리
            - 관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년
            - 예외사유 :
            제3조(처리하는 개인정보의 항목)① <맵땅>은(는) 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조, 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
            「 개인정보 보호법 제17조 」
            1. 정보주체의 동의를 받은 경우
            2. 개인정보보호법 제15조제1항제2호,제3호,제5호에 따라 개인정보를 수집한 목적 범위에서 개인정보를 제공하는 경우
            「 개인정보 보호법 제18조 」
            1. 정보주체로부터 별도의 동의를 받는 경우
            2. 법률에 특별한 규정이 있는 경우
            3. 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우
            4. 〈삭제〉
            5. 개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우로서 보호위원회의 심의 · 의결을 거친 경우
            6. 조약, 그 밖의 국제협정의 이행을 위하여 외국정보 또는 국제기구에 제공하기 위하여 필요한 경우
            7. 범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우
            8. 법원의 재판업무 수행을 위하여 필요한 경우
            9. 형(形) 및 감호, 보호처분의 집행을 위하여 필요한 경우
            제4조(개인정보의 제3자 제공에 관한 사항)① <맵땅>은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
            ② <맵땅>은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
            - 1. <맵땅>
            - 개인정보를 제공받는 자 : 맵땅
            - 제공받는 자의 개인정보 이용목적 : 이메일, 로그인ID, 이름, 서비스 이용 기록, 접속 로그, 접속 IP 정보, 사용자 데이터
            - 제공받는 자의 보유.이용기간: 1년
            제5조(개인정보처리의 위탁에 관한 사항)① <맵땅>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
            • 위탁받는 자 (수탁자) :
            • 위탁하는 업무의 내용 :
            • 위탁기간 : 서비스 종료
            ② <맵땅>은(는) 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
            ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.
            제6조(개인정보의 파기절차 및 파기방법)
            ① <맵땅>은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.1. 법령 근거 :2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.1. 파기절차<맵땅> 은(는) 파기 사유가 발생한 개인정보를 선정하고, <맵땅>의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
            2. 파기방법
            전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다
            제7조(미이용자의 개인정보 파기 등에 관한 조치)
            ① <맵땅>은(는) 1년간 서비스를 이용하지 않은 이용자의 정보를 파기하고 있습니다. 다만, 다른 법령에서 정한 보존기간이 경과할 때까지 다른 이용자의 개인정보와 분리하여 별도로 저장·관리할 수 있습니다.② <맵땅>은(는) 개인정보의 파기 30일 전까지 개인정보가 파기되는 사실, 기간 만료일 및 파기되는 개인정보의 항목을 이메일, 문자 등 이용자에게 통지 가능한 방법으로 알리고 있습니다.③ 개인정보의 파기를 원하지 않으시는 경우, 기간 만료 전 서비스 로그인을 하시면 됩니다.
            제8조(정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항)
            ① 정보주체는 맵땅에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
            ② 제1항에 따른 권리 행사는 맵땅에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 맵땅은(는) 이에 대해 지체 없이 조치하겠습니다.
            ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
            ④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
            ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
            ⑥  맵땅은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
            제9조(개인정보의 안전성 확보조치에 관한 사항) <맵땅>은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.
            1. 정기적인 자체 감사 실시개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.
            2. 개인정보 취급 직원의 최소화 및 교육개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.
            3. 개인정보의 암호화이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.
            4. 개인정보에 대한 접근 제한개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.
            제10조(개인정보를 자동으로 수집하는 장치의 설치·운영 및 그 거부에 관한 사항)
             맵땅은(는) 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용하지 않습니다.
            제11조(추가적인 이용·제공 판단기준) <맵땅>은(는) 개인정보를 당초 수집목적을 벗어나 이용/제공하지 않습니다. 다만 ｢개인정보 보호법｣ 제15조제3항 및 제17조제4항에 따라 ｢개인정보 보호법 시행령｣ 제14조의2에 따른 사항을 고려하여 정보주체의 동의 없이 개인정보를 추가적으로 이용·제공할 수 있습니다. 해당경우에는 개인정보보호법 시행령 제14조의2에 명시된 각 사항을 고려하여 정보주체의 이익을 부당하게 침해하지 않도록 하고 있습니다.
            「 개인정보 보호법 시행령 제14조의2 」
            1. 당초 수집 목적과 관련성이 있는지 여부
            2. 개인정보를 수집한 정황 또는 처리 관행에 비추어 볼 때 개인정보의 추가적인 이용 또는 제공에 대한 예측 가능성이 있는지 여부
            3. 정보주체의 이익을 부당하게 침해하는지 여부
            4. 가명처리 또는 암호화 등 안전성 확보에 필요한 조치를 하였는지 여부
            """
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = .black
        textView.backgroundColor = .clear
        textView.showsVerticalScrollIndicator = false
        return textView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindAction()
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        view.backgroundColor = .mapWhite
        navigationController?.navigationBar.isHidden = true
        view.addSubviews(navigationBar, textView)
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-18)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
    
    // MARK: - Bind
    
    private func bindAction() {
        navigationBar.backButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
}
