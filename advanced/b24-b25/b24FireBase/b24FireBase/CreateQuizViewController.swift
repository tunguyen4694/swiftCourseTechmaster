//
//  CreateQuizViewController.swift
//  b24FireBase
//
//  Created by Nguyễn Anh Tú on 30/05/2022.
//

import UIKit
import FirebaseFirestore

class CreateQuizViewController: UIViewController {

    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var firstAnswerTextField: UITextField!
    @IBOutlet weak var secondAnswerTextField: UITextField!
    @IBOutlet weak var subjextTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    
    @IBOutlet weak var firstSelectImageView: UIImageView!
    @IBOutlet weak var secondSelectImageView: UIImageView!
    
    var correctAnswer: String = ""
    let database = Firestore.firestore()
    var collections = [Collection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureFirst = UITapGestureRecognizer(target: self, action: #selector(selectImage(_:)))
        let tapGestureSecond = UITapGestureRecognizer(target: self, action: #selector(selectImage(_:)))
        
        firstSelectImageView.isUserInteractionEnabled = true
        secondSelectImageView.isUserInteractionEnabled = true
        
        firstSelectImageView.addGestureRecognizer(tapGestureFirst)
        secondSelectImageView.addGestureRecognizer(tapGestureSecond)
        
        getCollection("quizs")
//        for item in collections {
//            print(item)
//        }
    }
    
    func getCollection(_ note: String) {
        collections.removeAll()
        print("GET Collections")
        
        database.collection(note).getDocuments { querySnapshot, error in
            if let error = error {
                print("Có lỗi khi lấy data từ Firebase", error.localizedDescription)
            } else {
                print("Query Snapshot", querySnapshot?.documents)
                for document in querySnapshot!.documents {     // lặp collection
                    if let level = document.data()["level"] as? String,
                       let subject = document.data()["subject"] as? String,
                       let time = document.data()["time"] as? Int,
                       let questionArray = document.data()["questions"] as? [[String: Any]] {
                        print("level", level, subject, time, questionArray)
                        var questions = [Question]()
                        for item in questionArray {     // lặp câu hỏi trong collection
                            if let question = item["question"] as? String,
                               let note = item["note"] as? String,
                               let answer = item["answer"] as? String,
                               let answerArray = item["answers"] as? [[String: Any]] {
                                print("question", question, note, answer, answerArray)
                                var answers = [Answer]()
                                for answerArray in answerArray {    // lặp câu trả lời trong câu hỏi
                                    if let answer = answerArray["answer"] as? String,
                                       let isSelected = answerArray["isSelected"] as? Bool {
                                        answers.append(Answer(answer: answer, isSelected: isSelected))
                                    }
                                }
                                
                                let question0 = Question(question: question, note: note, answer: answer, answers: answers)
                                questions.append(question0)
                            }
                        }
                        
                        let collection = Collection(level: level, subject: subject, time: time, questions: questions)
                        self.collections.append(collection)
                    }
                }
            }
        }
//        for item in collections {
//            print(item)
//        }
    }
    
    @objc func selectImage(_ sender: UIGestureRecognizer) {
        print("Select image tag", sender.view?.tag ?? 0)
        let tag = sender.view?.tag ?? 0
        if tag == 1 {
            firstSelectImageView.image = UIImage(systemName: "checkmark.circle.fill")
            secondSelectImageView.image = UIImage(systemName: "checkmark.circle")
            correctAnswer = firstAnswerTextField.text ?? ""
        } else if tag == 2 {
            firstSelectImageView.image = UIImage(systemName: "checkmark.circle")
                secondSelectImageView.image = UIImage(systemName: "checkmark.circle.fill")
            correctAnswer = secondAnswerTextField.text ?? ""
        }
    }

    @IBAction func onPressCreateQuestion(_ sender: Any) {
        guard let question = questionTextView.text,
              let note = noteTextView.text,
              let subject = subjextTextField.text,
              let answer1 = firstAnswerTextField.text,
              let answer2 = secondAnswerTextField.text
        else {
            return
        }
        
        let questionObject = Question(question: question, note: note, answer: correctAnswer, answers: [Answer(answer: answer1, isSelected: false), Answer(answer: answer2, isSelected: false)])
        
//        for item in collections {
//            if item.subject == subject {
//                item.questions.append(questionObject)
//            }
//        }
        
//        for item in collections {
//            database.collection("quizs").addDocument(data: item.dictionary)
//
//        }
        
        let collectionObject = Collection(level: "1", subject: subject, time: 60, questions: [questionObject])
        
        database.collection("quizs").addDocument(data: collectionObject.dictionary)

        
//        let testCollection = database.collection("quiz")
//        print(testCollection.document().documentID)
    }

}
