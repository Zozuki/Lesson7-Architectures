//
//  AppDetailDescriptionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by user on 02.09.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailDescriptionViewController: UIViewController {

    private let app: ITunesApp
    
    private var appDetailDescriptionView: AppDetailDescriptionView {
        return self.view as! AppDetailDescriptionView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailDescriptionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    private func fillData() {
        appDetailDescriptionView.titleLabel.text = "Что нового"
        appDetailDescriptionView.subTitleVersionLabel.text = "Версия \(app.version)"
        appDetailDescriptionView.subTitleDescriptionLabel.text = app.releaseNotes
        
        appDetailDescriptionView.XDaysAgoLabel.text = "\(calculateNumberOfDaysFromDate(date: app.currentVersionReleaseDate).date) \(calculateNumberOfDaysFromDate(date: app.currentVersionReleaseDate).days) назад"
        appDetailDescriptionView.versionHistoryLabel.text = "История версий"
    }
    
    private func calculateNumberOfDaysFromDate(date: String) -> (date: Int, days: String) {
        var dayStr = ""
        let YMDDate = date.dropLast(10)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: String(YMDDate)) else { return (0, "дней назад") }
        let nowDate = Date()
        guard let days =  Calendar.current.dateComponents([.day], from: date, to: nowDate).day else { return  (0, "дней назад") }
        
        if days.description.last == "1" {
            dayStr = "день"
        } else if days.description.last == "2" || days.description.last == "3" || days.description.last == "4" {
            dayStr = "дня"
        } else if  days.description.last == "5" || days.description.last == "6" || days.description.last == "7" || days.description.last == "8" || days.description.last == "9" || days.description.last == "0"  {
            dayStr = "дней"
        }
        
        if days.description.count > 1 {
            dayStr = "дней"
        }
        return (days, dayStr)
    }

}
