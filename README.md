# 맵땅 iOS 🗺️

<img width="908" alt="image" src="https://github.com/user-attachments/assets/7d8bde8f-89b1-4b32-9a1b-7707d78e010a">

<br/>

## 프로젝트 기간
- **2024.07 ~ ing 개발 기간** <br>

<br/>

## 맵땅 이야기 보러 가기
- **[맵땅 Trouble Shooting](#-trouble-shooting)** <br>
- **[맵땅 고민 과정](#-고민-과정)** <br>
- **[맵땅 프로젝트 소개](#-프로젝트-소개)** <br>

<br/>

## 🧑‍💻 팀원 소개 (Team)

| [황찬미](https://github.com/cchanmi) | [박우연](https://github.com/Allie-e) |
| --- | --- |
| <img width="250" alt="image" src="https://github.com/user-attachments/assets/c107e678-6b63-40c7-a904-daed51d49771" /> | <img width="250" alt="image" src="https://github.com/user-attachments/assets/d9e5c14a-b0f8-451b-b8dc-33182614c0f6" /> |
| iOS Developer | iOS Developer |
| - 홈 지도 뷰 구현<br/> - 기록 작성 뷰, 기록 상세 뷰 구현 | - 스플래시, 온보딩 마이페이지 뷰 구현<br/> - 기록 리스트 뷰 구현 |

<br/>

# 🚀 Trouble Shooting
### 1) CollectionView Cell 재사용에 따른 중복 binding 이슈 해결
CollectionView Cell에 있는 버튼 클릭시, indexPath 값을 전달받아 해당 row의 cell을 삭제하는 로직을 구현하는 과정에서 중복 바인딩 문제가 발생하여서 index out of error로인해 앱이 크러쉬나는 이슈를 경험했습니다.

기존 문제가 되는 코드를 살펴보겠습니다.

```swift
reactor.state.compactMap{ $0.selectedArrayImage }
    .bind(to: imageCollectionView.rx.items) { (collectionView, row, element) in
        let indexPath = IndexPath(row: row, section: 0)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordImageCell.identifier, for: indexPath) as! RecordImageCell
        cell.recordImage.image = element
        
        cell.deleteButtonTappedSubject
            .subscribe(with: self, onNext: { _, indexPath in
                reactor.action.onNext(.deleteCellTapped(indexPath))
            })
            .disposed(by: self.disposeBag)
        
        return cell
    }
    .disposed(by: disposeBag)
````

해당 cell에 있는 삭제 버튼 클릭 시, cell의 indexPath 값을 전달하여 해당 row 값을 통해 배열 데이터를 지워 주는 로직을 구현하여 했습니다.
첫 클릭시에는 indexPath의 값이 잘 전달되지만, 두 번째 클릭부터는 [0, 1]의 값이 중복으로 두 번씩 전달되면서 배열의 index에 접근하여 remove 해 주고 있는 코드에서 index out of range error가 발생하게 되었습니다.

문제의 원인은 cell의 재사용 이슈 때문이었습니다.

![다운로드](https://github.com/user-attachments/assets/ddd7ee28-a385-4a3b-99f3-254c4332fd6f)

CollectionView는 cell을 매번 생성하지 않고, 화면에서 지워진 cell들은 queue에 넣고, 화면에서 나타날 생들을 queue에서 꺼내서 재사용하는 방식을 사용하고 있습니다.
<br/>

위의 코드처럼 .disposed(by: self.disposeBag)를 하게 되면 ViewController에 있는 disposeBag에 스트림을 저장하겠다는 의미이고, 그 의미는 곧, cell의 stream이 viewController의 생명주기와 같이 움직이겠다는 뜻이 됩니다.
우리가 원하는 것은 cell의 stream은 cell의 생명주기와 함께 진행되는 것을 원하기 때문에, cell 내의 cancelBag을 따로 만드는 방법으로 문제를 해결했습니다.

```swift
override func prepareForReuse() {
    super.prepareForReuse()
    self.disposeBag = DisposeBag()
}
````
 
cell 내의 disposeBag을 전역으로 생성해 두고, 해당 메서드에 disposeBag을 초기화해 줍니다.
그로인해 cell이 재사용 될 때마다 disposeBag을 새롭게 사용하여 stream이 중복으로 누적되어 있는 현상을 해결할 수 있었습니다.

```swift
cell.deleteButtonTappedSubject
    .subscribe(with: self, onNext: { _, indexPath in
        print("indexPath", indexPath)
        reactor.action.onNext(.deleteCellTapped(indexPath))
    })
    .disposed(by: cell.disposeBag)
````

self.dispoesBag이 아니라 cell.disposeBag을 해 주어서 해당 스트림을 cell의 생명주기와 맞게 바꿔 주어서 해결할 수 있었습니다.

<br/>

### 2) API 호출 시 메모리 해제가 발생하여 네트워크 요청이 취소되는 이슈 해결

초기에 onboarding 화면에서 색상선택 후 완료버튼을 누를 때 로그인 API 호출을 하고 다음 화면으로 넘어가도록 구현했습니다. 이 과정에서 서버통신 결과에 상관없이 다음 화면으로 넘어가도록 구현했기 때문에 온보딩 뷰컨트롤러가 화면에서 사라지면서 API호출이 취소되는 상황이 발생했습니다. Error log를 보면서 Alamofire의 error case 중 explicitlyCancelled에 대해 찾아보니, Observable이 구독된 후 너무 빨리 해제될 경우 네트워크 요청이 취소될 수 있다는 것을 알게 되었습니다.

```swift
🛰🛰🛰 NETWORK Reqeust LOG
POST https://mapddangtest.site/login/oauth2/apple
URL: https://mapddangtest.site/login/oauth2/apple
Method: POST
Headers: ["Accept": "application/json", "Content-Type": "application/json"]

Authorization: 
Body: {
  "selectedColor" : "PINK",
  "appleToken" : "c53002834f2854664b9a7021c23089293.0.prtwy.cq5uJkUZUAvgvqtBFciinA"
}
🛰🛰🛰 NETWORK Response LOG
URL: https://mapddangtest.site/login/oauth2/apple
Result: failure(Alamofire.AFError.explicitlyCancelled)
StatusCode: 0
Data:
````

온보딩 뷰 컨트롤러가 메모리에서 소멸되면서 Observable에 대한 구독이 해제되어 네트워크 요청이 완료되기 전에 취소되었고, 서버통신 결과에 상관없이 다음 화면으로 넘어가는 로직에 문제가 있다고 판단되어 정상적으로 API 통신에 성공했을 경우에만 다음 화면을 보여줄 수 있도록 로직을 수정했습니다.

```swift
🛰🛰🛰 NETWORK Reqeust LOG
POST https://mapddangtest.site/login/oauth2/apple (200)
URL: https://mapddangtest.site/login/oauth2/apple
Method: POST
Headers: ["Content-Type": "application/json", "Accept": "application/json"]

Authorization: 
Body: {
  "selectedColor" : "PINK",
  "appleToken" : "token"
}
````

<br/>

# 🚀 고민 과정
### 1) View 레이아웃 중첩 구조에 따른 터치 이벤트 이슈 고민 과정
| | |
|---|---|
|<img width="280" alt="Untitled" src="https://github.com/user-attachments/assets/1607db2f-f4ec-4962-acbd-56b416eb33b5">|<img width="280" alt="Untitle3d" src="https://github.com/user-attachments/assets/86756bba-3305-4196-9316-6c808379c13b">|
### 기록 리스트 화면에서 메뉴 뷰를 띄웠을때 밑에 셀의 범위와 겹치는 문제

기록 리스트 화면에서 각 셀의 우측에 있는 버튼을 눌렀을 때 수정/삭제 버튼이 있는 메뉴뷰를 보여주도록 구현했습니다. 그런데 메뉴뷰의 레이아웃이 다음 셀의 영역과 중첩이 되면서 해당 부분의 버튼에 대한 터치 이벤트가 제대로 동작하지 않는 이슈가 있었습니다.

뷰의 계층을 디버깅 해보니 메뉴뷰가 셀의 subview로 들어가 있어서 계층적으로 다음 셀의 상위에 위치할 수 없었습니다. 메뉴뷰의 z position을 조정하는 방법과 bringSubviewToFront() 메서드를 사용해도 해결되지 않은 이유도 이 문제 때문이었습니다. 또한, touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) 메서드로 확인 한 결과 삭제 버튼의 범위가 해당 셀의 범위를 벗어나서 touchevent 자체를 받지 못한다는 것을 알게되었습니다.

이 문제를 해결하기 위해 메뉴뷰를 collectionView의 subview로 추가하는 방법도 고민해보았으나, 각각의 cell과 관련된 기능과 이벤트를 받는 뷰가 컬렉션뷰에 추가된다는 점이 어색하다고 생각했습니다.

우선적으로 디자이너와 협의해 메뉴뷰의 레이아웃이 다음 셀과 중첩되지 않도록 수정해 진행했으며, 이 문제를 해결하기 위해 추가적인 공부가 필요할 것 같습니다.

| | |
|---|---|
|<img width="280" alt="3" src="https://github.com/user-attachments/assets/bc4859ba-67dd-4247-84fd-4abd7e820d72">|<img width="280" alt="5" src="https://github.com/user-attachments/assets/239f873a-2d9e-4d41-a0e4-b78f8d0d3f3f">|

# ⭐️ 프로젝트 소개

## ⚒️ 개발 환경
- iOS 15.0 +
- Xcode 15.0

<br/>

## ✔️ 사용 기술 & 라이브러리
- UIKit
- RxSwift
- Reactorkit
- Alamofire
- Kingfisher
- Snapkit

<br/>

## 🗂️ Skills

![아키텍쳐](https://github.com/user-attachments/assets/5dda0ade-30dd-4288-a05e-8f0e18019a31)
