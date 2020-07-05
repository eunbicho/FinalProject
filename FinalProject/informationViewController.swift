//
//  informationViewController.swift
//  FinalProject
//
//  Created by DigitalMedia-2017 on 2020/07/05.
//  Copyright © 2020 DigitalMedia-2017. All rights reserved.
//

import UIKit

class informationViewController: UIViewController {

    // 선물 이름, 이미지, 가격, 만족도, 유의할 점을 담을 변수들
    @IBOutlet var giftName: UILabel!
    @IBOutlet var giftImage: UIImageView!
    @IBOutlet var price: UILabel!
    @IBOutlet var satisfied: UILabel!
    @IBOutlet var concern: UILabel!
    
    var image: UIImage? // 전 컨트롤러에서 이미지 받아올 변수
    var name: String? // 전 컨트롤러에서 선물 이름 받아올 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Optional Binding (image에 값이 있다면, 즉 null이 아니라면 현재 이미지뷰에 그 값을 보여줌)
        if let contentImage = image{
            giftImage.image = contentImage
        }
        
        // Optional Binding (name에 값이 있다면, 즉 null이 아니라면 name의 값에 따라 라벨 값들을 다르게 지정)
        if let contentName = name{
            if contentName == "10_bag"{
                giftName.text = "[학생용 가방]"
                price.text = "- 가격: 60,000원"
                satisfied.text = "- 만족도: 90%"
                concern.text = "- 고려사항: 어깨,몸길이 사이즈"
            } else if contentName == "10_man_clothes"{
                giftName.text = "[남학생 인기옷]"
                price.text = "- 가격: 49,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 어깨,몸길이 사이즈"
            } else if contentName == "10_woman_clothes"{
                giftName.text = "[여학생 인기옷]"
                price.text = "- 가격: 46,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 어깨,몸길이 사이즈"
            } else if contentName == "10_woman_wallet"{
                giftName.text = "[여학생 지갑]"
                price.text = "- 가격: 55,000원"
                satisfied.text = "- 만족도: 80%"
                concern.text = "- 고려사항: 재질"
            } else if contentName == "10-30_outer"{
                giftName.text = "[트렌디한 아우터]"
                price.text = "- 가격: 250,000원"
                satisfied.text = "- 만족도: 90%"
                concern.text = "- 고려사항: 어깨,몸길이 사이즈"
            }  else if contentName == "20-30_man_bag"{
                giftName.text = "[남성용 명품가방]"
                price.text = "- 가격: 75,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 재질"
            }  else if contentName == "20-30_woman_bag"{
                giftName.text = "[여성용 명품가방]"
                price.text = "- 가격: 89,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 재질"
            }  else if contentName == "20-50_woman_wallet"{
                giftName.text = "[여성용 고급지갑]"
                price.text = "- 가격: 79,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 재질"
            }  else if contentName == "40-50_man_clothes"{
                giftName.text = "[남성용 옷]"
                price.text = "- 가격: 55,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 어깨,몸길이 사이즈"
            }  else if contentName == "40-50_man_hat"{
                giftName.text = "[남성용 모자]"
                price.text = "- 가격: 49,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 머리크기"
            }  else if contentName == "40-50_woman_clothes"{
                giftName.text = "[여성용 옷]"
                price.text = "- 가격: 79,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 어깨,몸길이 사이즈"
            }  else if contentName == "40-50_woman_hat"{
                giftName.text = "[여성용 모자]"
                price.text = "- 가격: 49,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 머리크기"
            }  else if contentName == "cafe"{
                giftName.text = "[카페 음료]"
                price.text = "- 가격: 15,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "cake"{
                giftName.text = "[케이크]"
                price.text = "- 가격: 24,000원"
                satisfied.text = "- 만족도: 90%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "chocolates"{
                giftName.text = "[초콜릿]"
                price.text = "- 가격: 20,000원"
                satisfied.text = "- 만족도: 95%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "clock"{
                giftName.text = "[손목시계]"
                price.text = "- 가격: 85,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 손목크기"
            }  else if contentName == "cookies"{
                giftName.text = "[고급쿠키세트]"
                price.text = "- 가격: 20,000원"
                satisfied.text = "- 만족도: 90%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "doll"{
                giftName.text = "[인형]"
                price.text = "- 가격: 32,000원"
                satisfied.text = "- 만족도: 80%"
                concern.text = "- 고려사항: 캐릭터 취향"
            }  else if contentName == "flower"{
                giftName.text = "[꽃]"
                price.text = "- 가격: 15,000원"
                satisfied.text = "- 만족도: 95%"
                concern.text = "- 고려사항: 꽃 알레르기 여부"
            }  else if contentName == "fruitset"{
                giftName.text = "[과일세트]"
                price.text = "- 가격: 45,000원"
                satisfied.text = "- 만족도: 90%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "icecream"{
                giftName.text = "[아이스크림]"
                price.text = "- 가격: 25,000원"
                satisfied.text = "- 만족도: 90%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "koreansweets"{
                giftName.text = "[한과세트]"
                price.text = "- 가격: 45,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "labtop"{
                giftName.text = "[노트북]"
                price.text = "- 가격: 1,005,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "man_wallet"{
                giftName.text = "[남성용 지갑]"
                price.text = "- 가격: 65,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 재질"
            }  else if contentName == "massager"{
                giftName.text = "[안마기]"
                price.text = "- 가격: 125,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 뭉친 몸 부위"
            }  else if contentName == "pen"{
                giftName.text = "[만년필]"
                price.text = "- 가격: 95,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 디자인 취향"
            }  else if contentName == "perfume"{
                giftName.text = "[향수]"
                price.text = "- 가격: 85,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 향기 취향"
            }  else if contentName == "redGinseng"{
                giftName.text = "[홍삼]"
                price.text = "- 가격: 85,000원"
                satisfied.text = "- 만족도: 90%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "redGinsengJelly"{
                giftName.text = "[홍삼젤리]"
                price.text = "- 가격: 65,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "ring"{
                giftName.text = "[커플링]"
                price.text = "- 가격: 125,000원"
                satisfied.text = "- 만족도: 90%"
                concern.text = "- 고려사항: 금속 알레르기 여부"
            }  else if contentName == "scarf"{
                giftName.text = "[스카프]"
                price.text = "- 가격: 35,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 색깔 취향"
            }  else if contentName == "shoes"{
                giftName.text = "[신발]"
                price.text = "- 가격: 15,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 발 사이즈"
            }  else if contentName == "sirloin set"{
                giftName.text = "[등심세트]"
                price.text = "- 가격: 95,000원"
                satisfied.text = "- 만족도: 95%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }  else if contentName == "sunglasses"{
                giftName.text = "[선글라스]"
                price.text = "- 가격: 35,000원"
                satisfied.text = "- 만족도: 85%"
                concern.text = "- 고려사항: 디자인 취향"
            }  else if contentName == "tie"{
                giftName.text = "[넥타이]"
                price.text = "- 가격: 45,000원"
                satisfied.text = "- 만족도: 90%"
                concern.text = "- 고려사항: 디자인 취향"
            }  else if contentName == "trouble patch"{
                giftName.text = "[여드름 화장품]"
                price.text = "- 가격: 75,000원"
                satisfied.text = "- 만족도: 95%"
                concern.text = "- 고려사항: 성분 알레르기 여부"
            }  else if contentName == "vitamin"{
                giftName.text = "[비타민]"
                price.text = "- 가격: 35,000원"
                satisfied.text = "- 만족도: 90%"
                concern.text = "- 고려사항: 음식 알레르기 여부"
            }


            
        }
    }

}
