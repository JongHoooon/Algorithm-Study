import Foundation


// global queue에 작업(클로저)을 비동기적으로 보낸다
DispatchQueue.global().async {
   
}



/*
DispatchQueue.global().async {}

// 유저와 직접적 상호작용, UI업데이트, 애니메이션, UI반응 관련 - 거의 즉시
DispatchQueue.global(qos: .userInteractive)

// 유저가 즉시 필요하긴 하지만, 비동기적으로 처리된 작업 - 몇초
DispatchQueue.global(qos: .userInitiated)

// 일반적인 작업
DispatchQueue.global()

// 보통 Progress Indicator와 함께 길게 실행되는 작업, 계산 - 몇초~몇분
DispatchQueue.global(qos: .utility)

// 속도보다는 에너지효율성 중시, 몇분이상
DispatchQueue.global(qos: .background)

// legacy API 지원(사용하지 않는다.)
DispatchQueue.global(qos: .unspecified)


// background qos queue
let queue = DispatchQueue.global(qos: .background)

// 작업을 보낼 때 더 높은 level로 보낸다
queue.async(qos: .utility) { }
*/


/*
DispatchQueue.global().async {
    //이미지 다운로드 코드
    
    DispatchQueue.main.async {
        // 다운로드한 이미지 표시는 main 쓰레드에서 한다.
        self.imageView.image = image
    }
}

URLSession.shared.dataTask(with: urlRequest) {
    // 이미지 다운로드 코드
    
    DispatchQueue.main.async {
        // 다운로드한 이미지 표시는 main 쓰레드에서 한다.
        self.imageView.image = image
    }
}
*/

