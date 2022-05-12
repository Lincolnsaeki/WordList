//
//  QuestionViewController.swift
//  WordList
//
//  Created by 佐伯凜乃介 on 2022/05/12.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var answerLabel:UILabel!
    @IBOutlet var questionLabel:UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered:Bool = false
    var wordArrey: [Dictionary<String, String>] = []
    var nowNumber: Int = 0
    let saveDate = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArrey = saveDate.array(forKey: "WORD") as! [Dictionary<String, String>]
        
        wordArrey.shuffle()
        questionLabel.text = wordArrey[nowNumber]["english"]
    }

    
    @IBAction func nextBottonTapped (){
        
        if isAnswered {
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < wordArrey.count{
                questionLabel.text = wordArrey[nowNumber]["english"]
                isAnswered = false
                nextButton.setTitle("答えを表示", for: .normal)
            }else{
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        }else{
            answerLabel.text = wordArrey[nowNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
        }
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
