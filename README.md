# 맵땅 iOS 🗺️

<img width="908" alt="image" src="https://github.com/user-attachments/assets/7d8bde8f-89b1-4b32-9a1b-7707d78e010a">

<br/>

## 프로젝트 기간
- **2024.07 ~ ing 개발 기간** <br>

<br/>

## 맵땅 이야기 보러 가기
- **[맵땅 Trouble Shooting](#-trouble-shooting)** <br>
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
