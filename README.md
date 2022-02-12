# DateFormatter의 비용 테스트 해보기
해당 실험은 [sarunw의 How expensive is DateFormatter article](https://sarunw.com/posts/how-expensive-is-dateformatter/)을 보고 해본 실험입니다. 

테스트를 위한 반복 횟수: 10000 회

### 1️⃣ 인스턴스 생성에 소요되는 시간 검증 
#### 🧪 검증을 위해 생성한 인스턴스의 종류 
- DateFormatter
- Date
- UIView

#### 👨🏻‍🔬 실험 결과 
|DateFormatter|Date|UIView|
|---|---|---|
|0.005초|0.003초|0.019초|

UIView가 가장 많은 시간이 소요됐고 Date와 DateFormatter는 큰 차이는 없었다. 
따라서 생성만 할 경우 DateFormatter의 비용이 그렇게 크진 않다는 것을 알 수 있었다. 

### 2️⃣ 사용할 때 소요되는 시간 검증
#### 🧪 검증을 위해 사용한 DateFormatter의 메서드 종류 
- `date(from:)`
- `string(from:)`

추가적으로 반복해서 DateFormatter를 생성할 때와 함수에서 한 번만 생성하고 사용했을 때의 시간 차이도 검증함. 

#### 👨🏻‍🔬 실험 결과 
|string(from:) & 반복해서 생성|string(from:) & 한 번만 생성|date(from:) & 반복해서 생성|date(from:) & 한 번만 생성|
|---|---|---|---|
|0.181초|0.005초|0.313초|0.134초|

일단 string(from:)보다 date(from:)이 더 큰 비용이 든다는 것을 알 수 있었다. 
또한 한 번만 DateFormatter를 생성해서 사용할 때보다 반복해서 생성할 때 훨씬 많은 비용이 드는 것을 확인할 수 있었다. 

즉, 생성 자체에는 그렇게 큰 비용을 차지하지 않았지만 반복해서 생성하고 사용하게 되면 비용이 굉장히 큰 폭으로 증가했다. 

### 3️⃣ 커스터마이즈해서 사용할 때 소요되는 시간 검증
#### 🧪 검증을 위해 사용한 DateFormatter의 프로퍼티 종류 
- `calendar`
- `timeZone`
- `locale`
- `dateFormat`
- `dateStyle` & `timeStyle`

추가적으로 반복해서 DateFormatter를 생성할 때와 함수에서 한 번만 생성하고 사용했을 때의 시간 차이도 검증함. 

#### 👨🏻‍🔬 실험 결과 
|`calendar` & 반복해서 생성|`calendar` & 한 번만 생성|`timeZone` & 반복해서 생성|`timeZone` & 한 번만 생성|
|---|---|---|---|
|0.531초|0.045초|0.508초|0.020초|
|`locale` & 반복해서 생성|`locale` & 한 번만 생성|`dateFormat` & 반복해서 생성|`dateFormat` & 한 번만 생성|
|0.178초|0.009초|0.390초|0.015초|
|`dateStyle` & `timeStyle` & 반복해서 생성|`dateStyle` & `timeStyle` & 한 번만 생성|-|-|
|0.497초|0.020초|-|-|


### 💭 결과를 통해 알게 된 점
DateFormatter를 생성만 할 때에는 그렇게 큰 비용이 들지 않았지만 사용할 때마다 매번 생성하게 된다면 비용이 굉장히 커지는 것을 볼 수 있었다.
앞으로도 DateFormatter를 반복적으로 사용할 때에는 최대한 한 번만 생성하고 사용할 수 있도록 해야겠다~~
