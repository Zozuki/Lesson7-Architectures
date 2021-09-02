//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 26.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: AnyObject {
    var searchResults: [ITunesApp] { get set }
    
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelect(app: ITunesApp)
}

class SearchPresenter {
    weak var viewInput: (UIViewController & SearchViewInput)?
    private let searchService = ITunesSearchService()
    
    private func requestApp(with query: String) {
        self.searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError { (error) in
                    self.viewInput?.showError(error: error)
                }
        }
    }
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
}

extension SearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: false)
        requestApp(with: query)
    }
    
    func viewDidSelect(app: ITunesApp) {
        openAppDetails(with: app)
    }
    
    
}
