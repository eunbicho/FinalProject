//
//  choiceViewController.swift
//  FinalProject
//
//  Created by DigitalMedia-2017 on 2020/07/05.
//  Copyright © 2020 DigitalMedia-2017. All rights reserved.
//

import UIKit

class choiceViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    // 텍스트필드와 피커뷰 변수 생성
       @IBOutlet var textName: UITextField!
       @IBOutlet var pickerGift: UIPickerView!

       // picker에 들어갈 배열 내용들
       let ageArray: Array<String> = ["10대", "20/30대", "40/50대"]
       let genderArray: [String] = ["남", "여"]
       let purposeArray: [String] = ["생일", "연인기념일", "명절선물"]
       let priceArray: [String] = ["5만원이하", "5만원이상"]
       
       // pickerView의 datasource method 정의(컴포넌트 4개)
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 4
       }
       
       // 총 경우의 수 36가지의 선물 배열 내용들
       let man_10_birth_cheap: [String] = ["icecream", "cafe"]
       let man_10_birth_expensive: [String] = ["pen", "clock", "shoes", "man_wallet"]
       let man_10_love_cheap: [String] = ["chocolates", "cookies", "cake", "flower"]
       let man_10_love_expensive: [String] = ["10_man_clothes", "clock", "man_wallet"]
       let man_10_holiday_cheap: [String] = ["vitamin", "10_man_clothes", "chocolates"]
       let man_10_holiday_expensive: [String] = ["redGinsengJelly", "10_bag", "10-30_outer", "clock"]
       
       let woman_10_birth_cheap: [String] = ["icecream", "cafe", "doll"]
       let woman_10_birth_expensive: [String] = ["pen", "trouble patch", "shoes", "10_woman_wallet"]
       let woman_10_love_cheap: [String] = ["chocolates", "cookies", "cake", "flower"]
       let woman_10_love_expensive: [String] = ["10_woman_clothes", "trouble patch", "10_woman_wallet"]
       let woman_10_holiday_cheap: [String] = ["vitamin", "10_man_clothes", "chocolates"]
       let woman_10_holiday_expensive: [String] = ["redGinsengJelly", "10_bag", "10-30_outer", "trouble patch"]
       
       let man_230_birth_cheap: [String] = ["icecream", "cafe"]
       let man_230_birth_expensive: [String] = ["20-30_man_bag", "man_wallet", "clock", "shoes"]
       let man_230_love_cheap: [String] = ["chocolates", "cookies", "cake", "flower"]
       let man_230_love_expensive: [String] = ["20-30_man_bag", "man_wallet", "clock", "shoes","perfume", "ring"]
       let man_230_holiday_cheap: [String] = ["tie", "icecream", "cafe", "chocolates"]
       let man_230_holiday_expensive: [String] = ["labtop", "20-30_man_bag", "10-30_outer"]
       
       let woman_230_birth_cheap: [String] = ["icecream", "cafe"]
       let woman_230_birth_expensive: [String] = ["20-30_woman_bag", "20-50_woman_wallet", "shoes"]
       let woman_230_love_cheap: [String] = ["chocolates", "cookies", "cake", "flower"]
       let woman_230_love_expensive: [String] = ["20-30_woman_bag", "20-50_woman_wallet", "perfume", "chocolates"]
       let woman_230_holiday_cheap: [String] = ["icecream", "cafe", "chocolates"]
       let woman_230_holiday_expensive: [String] = ["labtop", "20-30_woman_bag", "10-30_outer"]
       
       let man_450_birth_cheap: [String] = ["40-50_man_hat", "sunglasses"]
       let man_450_birth_expensive: [String] = ["man_wallet", "massager"]
       let man_450_love_cheap: [String] = ["40-50_man_hat", "sunglasses"]
       let man_450_love_expensive: [String] = ["man_wallet", "40-50_man_clothes"]
       let man_450_holiday_cheap: [String] = ["vitamin", "koreansweets", "fruitset"]
       let man_450_holiday_expensive: [String] = ["sirloin set", "redGinseng", "massager"]
       
       let woman_450_birth_cheap: [String] = ["40-50_woman_hat", "sunglasses"]
       let woman_450_birth_expensive: [String] = ["20-50_woman_wallet", "massager"]
       let woman_450_love_cheap: [String] = ["40-50_woman_hat", "sunglasses"]
       let woman_450_love_expensive: [String] = ["20-50_woman_wallet", "40-50_woman_clothes"]
       let woman_450_holiday_cheap: [String] = ["vitamin", "koreansweets", "fruitset"]
       let woman_450_holiday_expensive: [String] = ["sirloin set", "redGinseng", "massager"]
    
       
       // pickerView의 datasource method 정의(컴포넌트별 데이터개수)
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           
           if component == 0{
               return ageArray.count
           }
           else if component == 1{
               return genderArray.count
           }
           else if component == 2{
               return purposeArray.count
           }
           else {
               return priceArray.count
           }
       }
       
       
       // pickerView delegate method(폰트조절을 위해 viewForRow사용)
       func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
           let pickerLabel = UILabel()
           pickerLabel.font = UIFont.systemFont(ofSize:18)
           pickerLabel.textAlignment = NSTextAlignment.center
           if component == 0{
               pickerLabel.text = ageArray[row]
           }
           else if component == 1{
               pickerLabel.text = genderArray[row]
           }
           else if component == 2{
               pickerLabel.text = purposeArray[row]
           }
           else {
               pickerLabel.text = priceArray[row]
           }
           return pickerLabel
           
       }
      

       // 키보드 처리함수
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
       
       
       // 다음 화면으로 넘어가기 전 사전작업
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           // SettingViewController로 가는 segue라면
           if segue.identifier == "toResultView"{
               
               let destVC = segue.destination as! resultViewController // 다음 뷰컨트롤러는 resultViewController
               let name: String! = textName.text // 텍스트필드에 입력된 값을 변수에 저장
            
            // 그 값을 appDelegate 변수에도 저장
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.receiver = name
               
               // 각 컴포넌트별로 피커뷰에서 선택된 내용을 4개의 변수에 저장
               let age: String = ageArray[self.pickerGift.selectedRow(inComponent: 0)]
               let gender: String = genderArray[self.pickerGift.selectedRow(inComponent: 1)]
               let purpose: String = purposeArray[self.pickerGift.selectedRow(inComponent: 2)]
               let price: String = priceArray[self.pickerGift.selectedRow(inComponent: 3)]
               
               // 선택된 피커뷰의 내용에 따라 조건에 맞게 미리 설정한 배열을 다음 뷰컨트롤러의 배열로 넘겨줌
               if age == "10대"{
                   if gender == "남"{
                       if purpose == "생일"{
                           if price == "5만원이하"{
                               destVC.giftArray = man_10_birth_cheap
                           } else {
                               destVC.giftArray = man_10_birth_expensive
                           }
                       } else if purpose == "연인기념일"{
                           if price == "5만원이하"{
                               destVC.giftArray = man_10_love_cheap
                           } else {
                               destVC.giftArray = man_10_love_expensive
                           }
                       } else {
                           if price == "5만원이하"{
                               destVC.giftArray = man_10_holiday_cheap
                           } else {
                               destVC.giftArray = man_10_holiday_expensive
                           }
                       }
                   }else{
                       if purpose == "생일"{
                           if price == "5만원이하"{
                               destVC.giftArray = woman_10_birth_cheap
                           } else {
                               destVC.giftArray = woman_10_birth_expensive
                           }
                       } else if purpose == "연인기념일"{
                           if price == "5만원이하"{
                               destVC.giftArray = woman_10_love_cheap
                           } else {
                               destVC.giftArray = woman_10_love_expensive
                           }
                       } else {
                           if price == "5만원이하"{
                               destVC.giftArray = woman_10_holiday_cheap
                           } else {
                               destVC.giftArray = woman_10_holiday_expensive
                           }
                       }
                   }
               } else if age == "20/30대"{
                   if gender == "남"{
                       if purpose == "생일"{
                           if price == "5만원이하"{
                               destVC.giftArray = man_230_birth_cheap
                           } else {
                               destVC.giftArray = man_230_birth_expensive
                           }
                       } else if purpose == "연인기념일"{
                           if price == "5만원이하"{
                               destVC.giftArray = man_230_love_cheap
                           } else {
                               destVC.giftArray = man_230_love_expensive
                           }
                       } else {
                           if price == "5만원이하"{
                               destVC.giftArray = man_230_holiday_cheap
                           } else {
                               destVC.giftArray = man_230_holiday_expensive
                           }
                       }
                   }else{
                       if purpose == "생일"{
                           if price == "5만원이하"{
                               destVC.giftArray = woman_230_birth_cheap
                           } else {
                               destVC.giftArray = woman_230_birth_expensive
                           }
                       } else if purpose == "연인기념일"{
                           if price == "5만원이하"{
                               destVC.giftArray = woman_230_love_cheap
                           } else {
                               destVC.giftArray = woman_230_love_expensive
                           }
                       } else {
                           if price == "5만원이하"{
                               destVC.giftArray = woman_230_holiday_cheap
                           } else {
                               destVC.giftArray = woman_230_holiday_expensive
                           }
                       }
                   }
               } else if age == "40/50대"{
                   if gender == "남"{
                       if purpose == "생일"{
                           if price == "5만원이하"{
                               destVC.giftArray = man_450_birth_cheap
                           } else {
                               destVC.giftArray = man_450_birth_expensive
                           }
                       } else if purpose == "연인기념일"{
                           if price == "5만원이하"{
                               destVC.giftArray = man_450_love_cheap
                           } else {
                               destVC.giftArray = man_450_love_expensive
                           }
                       } else {
                           if price == "5만원이하"{
                               destVC.giftArray = man_450_holiday_cheap
                           } else {
                               destVC.giftArray = man_450_holiday_expensive
                           }
                       }
                   }else{
                       if purpose == "생일"{
                           if price == "5만원이하"{
                               destVC.giftArray = woman_450_birth_cheap
                           } else {
                               destVC.giftArray = woman_450_birth_expensive
                           }
                       } else if purpose == "연인기념일"{
                           if price == "5만원이하"{
                               destVC.giftArray = woman_450_love_cheap
                           } else {
                               destVC.giftArray = woman_450_love_expensive
                           }
                       } else {
                           if price == "5만원이하"{
                               destVC.giftArray = woman_450_holiday_cheap
                           } else {
                               destVC.giftArray = woman_450_holiday_expensive
                           }
                       }
                   }
               }
               
               var outString: String = name // 텍스트필드에서 입력한 이름을 변수에 저장
               var outString2: String = age + " , " + gender + " , " + purpose + " , " + price
               outString += "님을 위한 선물 추천 결과입니다." // 선택된 피커뷰의 내용을 한 문장으로 합쳐 변수에 저장
               
               destVC.info = outString // 저장한 문장을 다음 뷰컨트롤러의 변수에 저장
               destVC.chosen = outString2 // 저장한 피커뷰 내용을 다음 뷰컨트롤러의 변수에 저장
               destVC.title = "선물 추천결과" // 다음 뷰컨트롤러의 뷰타이틀 이름 지정
           }
       }
    
   

}
