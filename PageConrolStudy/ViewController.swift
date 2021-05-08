//
//  ViewController.swift
//  PageConrolStudy
//
//  Created by Dennis Lin on 2021/5/8.
//

import UIKit


struct dog{
    var dogType: String
    var title: String
    var imageName: String
    var idx: Int
    var description: String
}

let dog1Descripton = "阿拉斯加雪橇犬 又稱阿拉斯加馬拉穆，是最古老的雪橇犬之一。這種犬與同在阿拉斯加的其它犬種不同，四肢強壯有力，培育它的目的是為了耐力而不是速度，因而它們的主要用途是拉雪橇。"

let dog2Descripton = "聖伯納犬原產於瑞士，是當今世界上的一種超大型犬， 以雪地救護而聞名於世。聖伯納犬是一種體型巨大，身軀強壯且頭型稍大的狗兒，牠的祖先原居住在海拔2500公尺高的阿爾卑斯高山上，稱為阿爾卑斯獒犬，擁有許多山犬的特徵。"

let dog3Descripton = "羅威納一般是一種平靜、自信而勇敢的狗，其自信和冷漠使它不容易接近，也不隨便表示友好。 羅威納對環境變化的態度是自信且反應平靜。 它具有保衛家園、家庭的天性，它是一種非常聰明的狗，堅強、有適應性，非常樂於工作，使它成為一種很好的伴侶犬、護衛犬和多用途犬種。"

let dog4Descripton = "哈士奇的學名為西伯利亞雪橇犬，這是一個是原始的古老犬種，名字的由來是源自哈士奇獨特的嘶啞叫聲。在西伯利亞東北部的原始部落楚克奇族人，用這種外型酷似狼的犬種作為最原始的交通工具來拉雪橇"

let dog5Descripton = "伯恩山犬是一種自信、注意力集中、警惕性高、勇敢、忠於主人，面對陌生人自保意識強、平靜、氣質中等、易訓的狗狗。對小朋友和其它動物十分溫柔，同時對人性的感應力十分強，所以是一種非常完美的家庭犬"

var dogInfo = [dog(dogType: "阿拉斯加犬", title: "二弟", imageName: "阿拉斯加.jpeg", idx: 0, description: dog1Descripton),
               dog(dogType: "聖伯納", title: "表弟", imageName: "聖伯納.jpeg", idx: 1, description: dog2Descripton),
               dog(dogType: "羅威納", title: "爸爸", imageName: "羅威納.jpeg", idx: 2, description: dog3Descripton),
               dog(dogType: "哈士奇", title: "堂哥", imageName: "哈士奇.jpeg", idx: 3, description: dog4Descripton),
               dog(dogType: "伯恩山犬", title: "阿伯", imageName: "伯恩山犬.jpeg", idx: 4, description: dog5Descripton)
]




class ViewController: UIViewController {

    var m_curIndex: Int = 0
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dogSegmented: UISegmentedControl!
    @IBOutlet weak var dogPage: UIPageControl!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDogInfo(m_curIndex)
        for i in 0...4 {
            dogSegmented.setTitle(dogInfo[i].title, forSegmentAt: dogInfo[i].idx)
        }
    }


    func setDogInfo(_ idx: Int) -> () {
        dogImageView.image = UIImage(named: dogInfo[idx].imageName)
        nameLabel.text = dogInfo[idx].dogType
        dogPage.currentPage = dogInfo[idx].idx
        dogSegmented.selectedSegmentIndex = dogInfo[idx].idx
        contentTextView.text = dogInfo[idx].description
        m_curIndex = idx
    }
    
    @IBAction func segmentedControlChange(_ sender: UISegmentedControl) {
        setDogInfo(sender.selectedSegmentIndex)
    }
    
    @IBAction func nextBtnClick(_ sender: UIButton) {
        m_curIndex = (m_curIndex != 4) ? m_curIndex + 1 : 0
        setDogInfo(m_curIndex)
    }
    
    @IBAction func previousBtnClick(_ sender: UIButton) {
        m_curIndex = (m_curIndex != 0) ? m_curIndex - 1 : 4
        setDogInfo(m_curIndex)
    }
    
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        setDogInfo(sender.currentPage)
    }
    
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
            m_curIndex = (m_curIndex != 0) ? m_curIndex - 1 : 4
            setDogInfo(m_curIndex)
    }
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        m_curIndex = (m_curIndex != 4) ? m_curIndex + 1 : 0
        setDogInfo(m_curIndex)
    }
    
}
