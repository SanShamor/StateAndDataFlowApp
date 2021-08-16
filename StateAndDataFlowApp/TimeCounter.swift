//
//  TimeCounter.swift
//  StateAndDataFlowApp
//
//  Created by Александр on 16.08.2021.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    //благодаря этому свойству наш класс сможет уведомлять подписчиков об изменении своего состояния
    //говорим какой тип данных отправляем- тип TimeCounter
    //Never - тут можно определить тип Error для отправки ошибок, но это оффлайн приложение
    
    var counter = 3
    var timer: Timer?
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        
        objectWillChange.send(self)
    }
    
}
